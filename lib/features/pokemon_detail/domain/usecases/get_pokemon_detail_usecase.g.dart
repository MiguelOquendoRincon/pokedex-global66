// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_detail_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPokemonDetailUseCase)
final getPokemonDetailUseCaseProvider = GetPokemonDetailUseCaseProvider._();

final class GetPokemonDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetPokemonDetailUseCase,
          GetPokemonDetailUseCase,
          GetPokemonDetailUseCase
        >
    with $Provider<GetPokemonDetailUseCase> {
  GetPokemonDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPokemonDetailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPokemonDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPokemonDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPokemonDetailUseCase create(Ref ref) {
    return getPokemonDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPokemonDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPokemonDetailUseCase>(value),
    );
  }
}

String _$getPokemonDetailUseCaseHash() =>
    r'5facbe1ecc6d0df191e0f4118307721ef36ec0e9';
