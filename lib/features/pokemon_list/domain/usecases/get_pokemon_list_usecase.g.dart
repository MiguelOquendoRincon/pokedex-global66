// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_list_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that exposes an instance of [GetPokemonListUseCase].

@ProviderFor(getPokemonListUseCase)
final getPokemonListUseCaseProvider = GetPokemonListUseCaseProvider._();

/// A provider that exposes an instance of [GetPokemonListUseCase].

final class GetPokemonListUseCaseProvider
    extends
        $FunctionalProvider<
          GetPokemonListUseCase,
          GetPokemonListUseCase,
          GetPokemonListUseCase
        >
    with $Provider<GetPokemonListUseCase> {
  /// A provider that exposes an instance of [GetPokemonListUseCase].
  GetPokemonListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPokemonListUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPokemonListUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPokemonListUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPokemonListUseCase create(Ref ref) {
    return getPokemonListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPokemonListUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPokemonListUseCase>(value),
    );
  }
}

String _$getPokemonListUseCaseHash() =>
    r'9759731915efc199b06ae96f45f719e6167aa011';
