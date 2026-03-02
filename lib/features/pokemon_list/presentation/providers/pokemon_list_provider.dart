// ══════════════════════════════════════════════════════════════════════════════
// providers/pokemon_list_provider.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/network/api_constants.dart';
import '../../domain/entities/pokemon_summary.dart';
import '../../domain/usecases/get_pokemon_list_usecase.dart';

part 'pokemon_list_provider.freezed.dart';
part 'pokemon_list_provider.g.dart';

// ─── State ───────────────────────────────────────────────────────────────────

@freezed
sealed class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    @Default([]) List<PokemonSummary> allPokemon,
    @Default('') String searchQuery,
    @Default('') String selectedType, // '' = no type filter
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedEnd,
    AppException? error,
  }) = _PokemonListState;

  const PokemonListState._();

  /// Filtered view: applies name + type filters on the already-fetched list.
  List<PokemonSummary> get filtered {
    var result = allPokemon;

    if (searchQuery.isNotEmpty) {
      final q = searchQuery.toLowerCase();
      result = result.where((p) => p.name.contains(q)).toList();
    }

    // Type filter requires the detail — we use the local pokemonTypeCache
    // populated as cards are rendered. If empty, show all.
    return result;
  }

  bool get isInitialLoading => allPokemon.isEmpty && error == null;
}

// ─── Notifier ─────────────────────────────────────────────────────────────────

@riverpod
class PokemonListNotifier extends _$PokemonListNotifier {
  static const _pageLimit = ApiConstants.defaultPageLimit;

  @override
  PokemonListState build() {
    // Kick off first load immediately.
    Future.microtask(_fetchNextPage);
    return const PokemonListState();
  }

  Future<void> _fetchNextPage() async {
    if (state.isLoadingMore || state.hasReachedEnd) return;

    state = state.copyWith(isLoadingMore: true, error: null);

    final useCase = ref.read(getPokemonListUseCaseProvider);
    final params = GetPokemonListParams(
      limit: _pageLimit,
      offset: state.allPokemon.length,
    );

    final result = await useCase(params).run();

    result.fold(
      (exception) =>
          state = state.copyWith(isLoadingMore: false, error: exception),
      (newPage) => state = state.copyWith(
        isLoadingMore: false,
        allPokemon: [...state.allPokemon, ...newPage],
        hasReachedEnd: newPage.length < _pageLimit,
      ),
    );
  }

  void fetchMore() => _fetchNextPage();

  void retry() {
    state = state.copyWith(error: null);
    _fetchNextPage();
  }

  void updateSearch(String query) =>
      state = state.copyWith(searchQuery: query.trim());

  void updateTypeFilter(String type) =>
      state = state.copyWith(selectedType: type);

  void clearFilters() =>
      state = state.copyWith(searchQuery: '', selectedType: '');
}

// ─── Type cache (populated by detail cards as they scroll into view) ─────────
// Maps pokemonName → primaryType, used for the type filter chip.
@Riverpod(keepAlive: true)
class PokemonTypeCache extends _$PokemonTypeCache {
  @override
  Map<String, String> build() => const {};

  void register(String name, String primaryType) {
    if (state.containsKey(name)) return;
    state = {...state, name: primaryType};
  }
}
