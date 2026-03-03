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
  }) => listRepository.getPokemonList(limit: limit, offset: offset).map((
    summaries,
  ) {
    final initialPreviews = summaries
        .map(
          (s) => PokemonPreview(
            id: s.id,
            name: s.name,
            types: const [], // Initially empty, will be enriched
            imageUrl: s.imageUrl,
          ),
        )
        .toList();

    // 🚀 Background Enrichment: Start fetching details without blocking the UI
    if (ref.mounted) {
      _enrichAll(summaries);
    }

    return initialPreviews;
  });

  Future<void> _enrichAll(List<PokemonSummary> summaries) async {
    if (summaries.isEmpty) return;

    // ⚡ STEP 1: Burst - Fetch first 6 details in parallel
    // This ensures the initial viewport is enriched almost instantly.
    final burstCount = summaries.length > 6 ? 6 : summaries.length;
    final initialBurst = summaries.take(burstCount).toList();
    final remaining = summaries.skip(burstCount).toList();

    await Future.wait(initialBurst.map((s) => _fetchAndCache(s)));

    // 🐢 STEP 2: Steady - Fetch remaining details sequentially
    // This allows background loading without being too aggressive on the network.
    for (final s in remaining) {
      if (!ref.mounted) break;
      await _fetchAndCache(s);
    }
  }

  Future<void> _fetchAndCache(PokemonSummary s) async {
    // Check cache first
    final cache = ref.read(pokemonTypeCacheProvider);
    if (cache.containsKey(s.name)) return;

    // Fetch from network
    final result = await detailRepository
        .getPokemonDetail(s.name)
        .run()
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => left(AppException.unknown(message: 'Timeout')),
        );

    result.match(
      (error) => null, // Ignore failures
      (detail) {
        if (ref.mounted && detail.types.isNotEmpty) {
          ref
              .read(pokemonTypeCacheProvider.notifier)
              .register(s.name, detail.types);
        }
      },
    );
  }
}

@Riverpod(keepAlive: true)
GetPokemonPageUseCase getPokemonPageUseCase(Ref ref) => GetPokemonPageUseCase(
  listRepository: ref.read(pokemonRepositoryProvider),
  detailRepository: ref.read(pokemonDetailRepositoryProvider),
  ref: ref,
);
