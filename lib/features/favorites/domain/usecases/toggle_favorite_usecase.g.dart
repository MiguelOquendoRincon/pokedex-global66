// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_favorite_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(toggleFavoriteUseCase)
final toggleFavoriteUseCaseProvider = ToggleFavoriteUseCaseProvider._();

final class ToggleFavoriteUseCaseProvider
    extends
        $FunctionalProvider<
          ToggleFavoriteUseCase,
          ToggleFavoriteUseCase,
          ToggleFavoriteUseCase
        >
    with $Provider<ToggleFavoriteUseCase> {
  ToggleFavoriteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleFavoriteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleFavoriteUseCaseHash();

  @$internal
  @override
  $ProviderElement<ToggleFavoriteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleFavoriteUseCase create(Ref ref) {
    return toggleFavoriteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleFavoriteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleFavoriteUseCase>(value),
    );
  }
}

String _$toggleFavoriteUseCaseHash() =>
    r'd695297f8f2b7c1fe8b06f3edfb8603565db5201';
