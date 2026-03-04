// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that exposes the [IFavoritesRepository] implementation.

@ProviderFor(favoritesRepository)
final favoritesRepositoryProvider = FavoritesRepositoryProvider._();

/// A provider that exposes the [IFavoritesRepository] implementation.

final class FavoritesRepositoryProvider
    extends
        $FunctionalProvider<
          IFavoritesRepository,
          IFavoritesRepository,
          IFavoritesRepository
        >
    with $Provider<IFavoritesRepository> {
  /// A provider that exposes the [IFavoritesRepository] implementation.
  FavoritesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesRepositoryHash();

  @$internal
  @override
  $ProviderElement<IFavoritesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IFavoritesRepository create(Ref ref) {
    return favoritesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IFavoritesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IFavoritesRepository>(value),
    );
  }
}

String _$favoritesRepositoryHash() =>
    r'009fa57c0770f7bcb023c86e5499568d3bd89f2f';
