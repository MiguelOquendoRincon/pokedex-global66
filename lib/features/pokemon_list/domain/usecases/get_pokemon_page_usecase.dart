import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/repositories/pokemon_detail_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/repositories/pokemon_details_repository.dart';
import 'package:pokedex_global66/features/pokemon_list/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/core/l10n/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_page_usecase.g.dart';

/// A use case that fetches a page of [PokemonPreview]s.
///
/// It first retrieves a list of [PokemonSummary] from the [listRepository] and
/// map them to initial [PokemonPreview]s (with no types). Then, it triggers
/// a background process to fetch and cache details (like types) for each
/// Pokémon using the [detailRepository].
class GetPokemonPageUseCase {
  const GetPokemonPageUseCase({
    required this.listRepository,
    required this.detailRepository,
    required this.ref,
  });

  final IPokemonRepository listRepository;
  final IPokemonDetailRepository detailRepository;
  final Ref ref;

  /// Fetches a page of Pokémon previews.
  ///
  /// Returns a [TaskEither] that, when run, will return the initial list of previews.
  /// The enrichment of types happens asynchronously in the background.
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

    if (ref.mounted) {
      _enrichAll(summaries);
    }

    return initialPreviews;
  });

  Future<void> _enrichAll(List<PokemonSummary> summaries) async {
    if (summaries.isEmpty) return;

    final burstCount = summaries.length > 6 ? 6 : summaries.length;
    final initialBurst = summaries.take(burstCount).toList();
    final remaining = summaries.skip(burstCount).toList();

    await Future.wait(initialBurst.map((s) => _fetchAndCache(s)));

    for (final s in remaining) {
      if (!ref.mounted) break;
      await _fetchAndCache(s);
    }
  }

  Future<void> _fetchAndCache(PokemonSummary s) async {
    final cache = ref.read(pokemonTypeCacheProvider);
    if (cache.containsKey(s.name)) return;

    final language = ref.read(localeProvider)?.languageCode ?? 'en';
    final Either<AppException, PokemonDetail> result = await detailRepository
        .getPokemonDetail(s.name, language)
        .run()
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => Left(AppException.unknown(message: 'Timeout')),
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

/// A provider that exposes an instance of [GetPokemonPageUseCase].
@Riverpod(keepAlive: true)
GetPokemonPageUseCase getPokemonPageUseCase(Ref ref) => GetPokemonPageUseCase(
  listRepository: ref.read(pokemonRepositoryProvider),
  detailRepository: ref.read(pokemonDetailRepositoryProvider),
  ref: ref,
);
