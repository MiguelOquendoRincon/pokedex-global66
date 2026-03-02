// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorites_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFavoritesUseCase)
final getFavoritesUseCaseProvider = GetFavoritesUseCaseProvider._();

final class GetFavoritesUseCaseProvider
    extends
        $FunctionalProvider<
          GetFavoritesUseCase,
          GetFavoritesUseCase,
          GetFavoritesUseCase
        >
    with $Provider<GetFavoritesUseCase> {
  GetFavoritesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFavoritesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFavoritesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetFavoritesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetFavoritesUseCase create(Ref ref) {
    return getFavoritesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFavoritesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFavoritesUseCase>(value),
    );
  }
}

String _$getFavoritesUseCaseHash() =>
    r'2799a3bb994fd51ca4ca2f3d55c31c33af731788';
