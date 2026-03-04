// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier that manages the state of the Pokémon detail screen.
///
/// It fetches details based on the [pokemonName] and the current locale.
/// It also populates the [PokemonTypeCache] upon successful data retrieval.

@ProviderFor(PokemonDetailNotifier)
final pokemonDetailProvider = PokemonDetailNotifierFamily._();

/// A notifier that manages the state of the Pokémon detail screen.
///
/// It fetches details based on the [pokemonName] and the current locale.
/// It also populates the [PokemonTypeCache] upon successful data retrieval.
final class PokemonDetailNotifierProvider
    extends $NotifierProvider<PokemonDetailNotifier, PokemonDetailState> {
  /// A notifier that manages the state of the Pokémon detail screen.
  ///
  /// It fetches details based on the [pokemonName] and the current locale.
  /// It also populates the [PokemonTypeCache] upon successful data retrieval.
  PokemonDetailNotifierProvider._({
    required PokemonDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'pokemonDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pokemonDetailNotifierHash();

  @override
  String toString() {
    return r'pokemonDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PokemonDetailNotifier create() => PokemonDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PokemonDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PokemonDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pokemonDetailNotifierHash() =>
    r'b4a97c4ba2bb578323047b69060f034734d87fcd';

/// A notifier that manages the state of the Pokémon detail screen.
///
/// It fetches details based on the [pokemonName] and the current locale.
/// It also populates the [PokemonTypeCache] upon successful data retrieval.

final class PokemonDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PokemonDetailNotifier,
          PokemonDetailState,
          PokemonDetailState,
          PokemonDetailState,
          String
        > {
  PokemonDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'pokemonDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A notifier that manages the state of the Pokémon detail screen.
  ///
  /// It fetches details based on the [pokemonName] and the current locale.
  /// It also populates the [PokemonTypeCache] upon successful data retrieval.

  PokemonDetailNotifierProvider call(String pokemonName) =>
      PokemonDetailNotifierProvider._(argument: pokemonName, from: this);

  @override
  String toString() => r'pokemonDetailProvider';
}

/// A notifier that manages the state of the Pokémon detail screen.
///
/// It fetches details based on the [pokemonName] and the current locale.
/// It also populates the [PokemonTypeCache] upon successful data retrieval.

abstract class _$PokemonDetailNotifier extends $Notifier<PokemonDetailState> {
  late final _$args = ref.$arg as String;
  String get pokemonName => _$args;

  PokemonDetailState build(String pokemonName);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PokemonDetailState, PokemonDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PokemonDetailState, PokemonDetailState>,
              PokemonDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
