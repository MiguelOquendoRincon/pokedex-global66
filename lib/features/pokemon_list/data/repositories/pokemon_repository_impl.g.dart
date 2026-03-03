// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pokemonRepository)
final pokemonRepositoryProvider = PokemonRepositoryProvider._();

final class PokemonRepositoryProvider
    extends
        $FunctionalProvider<
          IPokemonRepository,
          IPokemonRepository,
          IPokemonRepository
        >
    with $Provider<IPokemonRepository> {
  PokemonRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonRepositoryHash();

  @$internal
  @override
  $ProviderElement<IPokemonRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IPokemonRepository create(Ref ref) {
    return pokemonRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPokemonRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPokemonRepository>(value),
    );
  }
}

String _$pokemonRepositoryHash() => r'ca2d76159d74b01341f483ce179b25d4b3776df7';
