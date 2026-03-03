// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pokemonListRemoteDatasource)
final pokemonListRemoteDatasourceProvider =
    PokemonListRemoteDatasourceProvider._();

final class PokemonListRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          IPokemonListRemoteDatasource,
          IPokemonListRemoteDatasource,
          IPokemonListRemoteDatasource
        >
    with $Provider<IPokemonListRemoteDatasource> {
  PokemonListRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonListRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonListRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<IPokemonListRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IPokemonListRemoteDatasource create(Ref ref) {
    return pokemonListRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPokemonListRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPokemonListRemoteDatasource>(value),
    );
  }
}

String _$pokemonListRemoteDatasourceHash() =>
    r'd5cca0a3cfd239f5107e395743b36e04857cf3ed';
