// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier that manages the state of the Pokémon list.
///
/// It handles fetching pages of Pokémon, retrying on failure, and
/// updating filters. It uses [GetPokemonPageUseCase] for data retrieval.

@ProviderFor(PokemonListNotifier)
final pokemonListProvider = PokemonListNotifierProvider._();

/// A notifier that manages the state of the Pokémon list.
///
/// It handles fetching pages of Pokémon, retrying on failure, and
/// updating filters. It uses [GetPokemonPageUseCase] for data retrieval.
final class PokemonListNotifierProvider
    extends $NotifierProvider<PokemonListNotifier, PokemonListState> {
  /// A notifier that manages the state of the Pokémon list.
  ///
  /// It handles fetching pages of Pokémon, retrying on failure, and
  /// updating filters. It uses [GetPokemonPageUseCase] for data retrieval.
  PokemonListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonListNotifierHash();

  @$internal
  @override
  PokemonListNotifier create() => PokemonListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PokemonListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PokemonListState>(value),
    );
  }
}

String _$pokemonListNotifierHash() =>
    r'08165e9b9128372380c68bf64afe25d453737ff4';

/// A notifier that manages the state of the Pokémon list.
///
/// It handles fetching pages of Pokémon, retrying on failure, and
/// updating filters. It uses [GetPokemonPageUseCase] for data retrieval.

abstract class _$PokemonListNotifier extends $Notifier<PokemonListState> {
  PokemonListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PokemonListState, PokemonListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PokemonListState, PokemonListState>,
              PokemonListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
