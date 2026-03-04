// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier that manages the list of favorite Pokémon.
///
/// It handles loading favorites from local storage on initialization and
/// providing methods to toggle the favorite status of a Pokémon.

@ProviderFor(FavoritesNotifier)
final favoritesProvider = FavoritesNotifierProvider._();

/// A notifier that manages the list of favorite Pokémon.
///
/// It handles loading favorites from local storage on initialization and
/// providing methods to toggle the favorite status of a Pokémon.
final class FavoritesNotifierProvider
    extends $NotifierProvider<FavoritesNotifier, List<FavoritePokemon>> {
  /// A notifier that manages the list of favorite Pokémon.
  ///
  /// It handles loading favorites from local storage on initialization and
  /// providing methods to toggle the favorite status of a Pokémon.
  FavoritesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesNotifierHash();

  @$internal
  @override
  FavoritesNotifier create() => FavoritesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FavoritePokemon> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FavoritePokemon>>(value),
    );
  }
}

String _$favoritesNotifierHash() => r'c98013ce5b8d62bb9cf71e47ef77205f54d6f97b';

/// A notifier that manages the list of favorite Pokémon.
///
/// It handles loading favorites from local storage on initialization and
/// providing methods to toggle the favorite status of a Pokémon.

abstract class _$FavoritesNotifier extends $Notifier<List<FavoritePokemon>> {
  List<FavoritePokemon> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<FavoritePokemon>, List<FavoritePokemon>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<FavoritePokemon>, List<FavoritePokemon>>,
              List<FavoritePokemon>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
