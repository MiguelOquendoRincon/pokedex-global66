// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that exposes the [IPokemonDetailRepository] implementation.

@ProviderFor(pokemonDetailRepository)
final pokemonDetailRepositoryProvider = PokemonDetailRepositoryProvider._();

/// A provider that exposes the [IPokemonDetailRepository] implementation.

final class PokemonDetailRepositoryProvider
    extends
        $FunctionalProvider<
          IPokemonDetailRepository,
          IPokemonDetailRepository,
          IPokemonDetailRepository
        >
    with $Provider<IPokemonDetailRepository> {
  /// A provider that exposes the [IPokemonDetailRepository] implementation.
  PokemonDetailRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonDetailRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonDetailRepositoryHash();

  @$internal
  @override
  $ProviderElement<IPokemonDetailRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IPokemonDetailRepository create(Ref ref) {
    return pokemonDetailRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPokemonDetailRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPokemonDetailRepository>(value),
    );
  }
}

String _$pokemonDetailRepositoryHash() =>
    r'115ad7a164acf50532ffafc206ba507143b34c33';
