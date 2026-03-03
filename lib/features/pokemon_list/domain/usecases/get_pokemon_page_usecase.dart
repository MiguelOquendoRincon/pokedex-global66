import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/repositories/pokemon_detail_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/repositories/pokemon_details_repository.dart';
import 'package:pokedex_global66/features/pokemon_list/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_page_usecase.g.dart';

/// Fetches one page of the list AND the minimum detail (type + image)
/// for each Pokémon in that page — all in parallel.
///
/// Returns a fully-enriched [List<PokemonPreview>] ready to render
/// without any secondary lazy fetch from the UI layer.
///
/// Error strategy:
///   - If the list call fails → Left(AppException).
///   - If individual detail calls fail → that Pokémon gets a fallback
///     preview (type: 'normal', imageUrl from CDN by ID).
///     The page is never blocked by one bad detail call.
class GetPokemonPageUseCase {
  const GetPokemonPageUseCase({
    required this.listRepository,
    required this.detailRepository,
    required this.ref,
  });

  final IPokemonRepository listRepository;
  final IPokemonDetailRepository detailRepository;
  final Ref ref;

  TaskEither<AppException, List<PokemonPreview>> call({
    required int limit,
    required int offset,
  }) =>
      // Step 1: fetch the list page (fast — no detail data)
      listRepository
          .getPokemonList(limit: limit, offset: offset)
          // Step 2: for each summary, fetch its detail in parallel
          .flatMap(
            (summaries) => TaskEither.tryCatch(
              () => _enrichAll(summaries),
              (e, _) => AppException.unknown(message: e.toString(), cause: e),
            ),
          );

  Future<List<PokemonPreview>> _enrichAll(
    List<PokemonSummary> summaries,
  ) async {
    final previews = <PokemonPreview>[];

    for (final s in summaries) {
      final p = await _enrichOne(s);
      previews.add(p);

      // Update cache immediately for each success
      if (p.types.isNotEmpty && ref.mounted) {
        ref.read(pokemonTypeCacheProvider.notifier).register(p.name, p.types);
      }
    }

    return previews;
  }

  Future<PokemonPreview> _enrichOne(PokemonSummary summary) async {
    // Check local cache first to avoid network calls.
    final cache = ref.read(pokemonTypeCacheProvider);
    if (cache.containsKey(summary.name)) {
      return PokemonPreview(
        id: summary.id,
        name: summary.name,
        types: cache[summary.name]!,
        imageUrl: summary.imageUrl,
      );
    }

    // Attempt to fetch from network with a per-item timeout.
    final result = await detailRepository
        .getPokemonDetail(summary.name)
        .run()
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => left(AppException.unknown(message: 'Timeout')),
        );

    return result.fold(
      // Fallback on failure (e.g. 404, network error, timeout).
      // Returning empty types allows the UI to show a skeleton/loading state
      // instead of a confusing "Normal" type.
      (_) => PokemonPreview(
        id: summary.id,
        name: summary.name,
        types: const [],
        imageUrl: summary.imageUrl,
      ),
      // Succeeded.
      (detail) => PokemonPreview(
        id: detail.id,
        name: detail.name,
        types: detail.types,
        imageUrl: detail.imageUrl ?? summary.imageUrl,
      ),
    );
  }
}

@Riverpod(keepAlive: true)
GetPokemonPageUseCase getPokemonPageUseCase(Ref ref) => GetPokemonPageUseCase(
  listRepository: ref.read(pokemonRepositoryProvider),
  detailRepository: ref.read(pokemonDetailRepositoryProvider),
  ref: ref,
);
