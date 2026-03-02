// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pokemonDetailRepository)
final pokemonDetailRepositoryProvider = PokemonDetailRepositoryProvider._();

final class PokemonDetailRepositoryProvider
    extends
        $FunctionalProvider<
          IPokemonDetailRepository,
          IPokemonDetailRepository,
          IPokemonDetailRepository
        >
    with $Provider<IPokemonDetailRepository> {
  PokemonDetailRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonDetailRepositoryProvider',
        isAutoDispose: true,
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
    r'c9670658974f688cc9bd21efcf62dd95d143b7a5';
