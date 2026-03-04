// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_page_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that exposes an instance of [GetPokemonPageUseCase].

@ProviderFor(getPokemonPageUseCase)
final getPokemonPageUseCaseProvider = GetPokemonPageUseCaseProvider._();

/// A provider that exposes an instance of [GetPokemonPageUseCase].

final class GetPokemonPageUseCaseProvider
    extends
        $FunctionalProvider<
          GetPokemonPageUseCase,
          GetPokemonPageUseCase,
          GetPokemonPageUseCase
        >
    with $Provider<GetPokemonPageUseCase> {
  /// A provider that exposes an instance of [GetPokemonPageUseCase].
  GetPokemonPageUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPokemonPageUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPokemonPageUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPokemonPageUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPokemonPageUseCase create(Ref ref) {
    return getPokemonPageUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPokemonPageUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPokemonPageUseCase>(value),
    );
  }
}

String _$getPokemonPageUseCaseHash() =>
    r'9ae59abb8b37fb7d9fc0f724dccc5ad1b1017f8b';
