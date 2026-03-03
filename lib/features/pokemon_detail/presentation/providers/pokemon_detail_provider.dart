import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex_global66/core/l10n/locale_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';

part 'pokemon_detail_provider.freezed.dart';
part 'pokemon_detail_provider.g.dart';

/// Represents the state of the Pokémon detail screen.
@freezed
sealed class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    /// The detailed information of the Pokémon, if loaded.
    PokemonDetail? detail,

    /// True while the details are being fetched from the API.
    @Default(false) bool isLoading,

    /// Non-null if the fetch operation failed.
    AppException? error,
  }) = _PokemonDetailState;
}

/// A notifier that manages the state of the Pokémon detail screen.
///
/// It fetches details based on the [pokemonName] and the current locale.
/// It also populates the [PokemonTypeCache] upon successful data retrieval.
@riverpod
class PokemonDetailNotifier extends _$PokemonDetailNotifier {
  @override
  PokemonDetailState build(String pokemonName) {
    // Watch for locale changes to refresh translated content
    ref.watch(localeProvider);
    Future.microtask(() => _load(pokemonName));
    return const PokemonDetailState(isLoading: true);
  }

  Future<void> _load(String name) async {
    state = state.copyWith(isLoading: true, error: null);

    final useCase = ref.read(getPokemonDetailUseCaseProvider);
    final language = ref.read(localeProvider)?.languageCode ?? 'en';

    final result = await useCase(
      GetPokemonDetailParams(name: name, language: language),
    ).run();

    if (!ref.mounted) return;

    result.fold((e) => state = state.copyWith(isLoading: false, error: e), (
      detail,
    ) {
      state = state.copyWith(isLoading: false, detail: detail);

      // Populate the type cache so the list screen can filter.
      ref.read(pokemonTypeCacheProvider.notifier).register(name, detail.types);
    });
  }

  /// Retries the detail loading process.
  void retry() => _load(pokemonName);
}
