import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/network/api_constants.dart';
import '../../domain/entities/pokemon_preview.dart';
import '../../domain/usecases/get_pokemon_page_usecase.dart';

part 'pokemon_list_provider.freezed.dart';
part 'pokemon_list_provider.g.dart';

// ─── State ────────────────────────────────────────────────────────────────────

@freezed
sealed class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    /// Fully enriched previews — ready to render with color and type.
    @Default([]) List<PokemonPreview> previews,

    /// True only while the very first page is loading.
    @Default(false) bool isInitialLoading,

    /// True while loading pages 2, 3, … (pagination).
    @Default(false) bool isLoadingMore,

    @Default(false) bool hasReachedEnd,

    /// Non-null only on hard failures (first page).
    AppException? error,

    /// Active name filter (search bar).
    @Default('') String searchQuery,

    /// Active single-type filter (horizontal chip row). Empty string = no filter.
    @Default('') String selectedType,

    /// Active multi-type filter (bottom-sheet filter). Empty set = no filter.
    @Default(<String>{}) Set<String> selectedTypes,
  }) = _PokemonListState;

  const PokemonListState._();

  /// True if any filter is active (used to show clear-all affordance).
  bool get hasActiveFilters =>
      searchQuery.isNotEmpty ||
      selectedType.isNotEmpty ||
      selectedTypes.isNotEmpty;
}

// ─── Notifier ─────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class PokemonListNotifier extends _$PokemonListNotifier {
  static const _pageLimit = ApiConstants.defaultPageLimit;

  @override
  PokemonListState build() {
    Future.microtask(_fetchPage);
    return const PokemonListState(isInitialLoading: true);
  }

  // ── Private ────────────────────────────────────────────────────────────────

  Future<void> _fetchPage() async {
    final isFirst = state.previews.isEmpty;

    state = state.copyWith(
      isInitialLoading: isFirst,
      isLoadingMore: !isFirst,
      error: null,
    );

    try {
      final useCase = ref.read(getPokemonPageUseCaseProvider);

      // Safety: Add a global timeout for the entire page enrichment.
      // If the API or enrichment hangs, we should eventually show an error.
      final result =
          await useCase(
            limit: _pageLimit,
            offset: state.previews.length,
          ).run().timeout(
            const Duration(seconds: 20),
            onTimeout: () => left(
              AppException.unknown(
                message: 'Request timed out. Please check your connection.',
              ),
            ),
          );

      if (!ref.mounted) return;

      result.fold(
        (exception) => state = state.copyWith(
          isInitialLoading: false,
          isLoadingMore: false,
          error: exception,
        ),
        (newPreviews) => state = state.copyWith(
          isInitialLoading: false,
          isLoadingMore: false,
          previews: [...state.previews, ...newPreviews],
          hasReachedEnd: newPreviews.length < _pageLimit,
        ),
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isInitialLoading: false,
        isLoadingMore: false,
        error: AppException.unknown(message: e.toString(), cause: e),
      );
    }
  }

  // ── Public API ─────────────────────────────────────────────────────────────

  void fetchMore() {
    if (state.isLoadingMore || state.hasReachedEnd) return;
    _fetchPage();
  }

  void retry() {
    state = state.copyWith(error: null, isInitialLoading: true);
    _fetchPage();
  }

  void updateSearch(String query) =>
      state = state.copyWith(searchQuery: query.trim());

  /// Updates the single-type chip-row filter.
  void updateTypeFilter(String type) =>
      state = state.copyWith(selectedType: type);

  /// Updates the multi-type filter from the bottom sheet.
  void updateTypeFilters(Set<String> types) =>
      state = state.copyWith(selectedTypes: types);

  /// Clears the multi-type filter.
  void clearTypeFilters() => state = state.copyWith(selectedTypes: {});

  void clearFilters() => state = state.copyWith(
    searchQuery: '',
    selectedType: '',
    selectedTypes: {},
  );
}
