// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pokemonDetailRemoteDatasource)
final pokemonDetailRemoteDatasourceProvider =
    PokemonDetailRemoteDatasourceProvider._();

final class PokemonDetailRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          IPokemonDetailRemoteDatasource,
          IPokemonDetailRemoteDatasource,
          IPokemonDetailRemoteDatasource
        >
    with $Provider<IPokemonDetailRemoteDatasource> {
  PokemonDetailRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonDetailRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonDetailRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<IPokemonDetailRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IPokemonDetailRemoteDatasource create(Ref ref) {
    return pokemonDetailRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IPokemonDetailRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IPokemonDetailRemoteDatasource>(
        value,
      ),
    );
  }
}

String _$pokemonDetailRemoteDatasourceHash() =>
    r'f1317eef13f12d083d1faffeeb64c4fb062ef1fe';
