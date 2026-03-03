import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/pokemon_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';

part 'pokemon_detail_provider.freezed.dart';
part 'pokemon_detail_provider.g.dart';

@freezed
sealed class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    PokemonDetail? detail,
    @Default(false) bool isLoading,
    AppException? error,
  }) = _PokemonDetailState;
}

@riverpod
class PokemonDetailNotifier extends _$PokemonDetailNotifier {
  @override
  PokemonDetailState build(String pokemonName) {
    Future.microtask(() => _load(pokemonName));
    return const PokemonDetailState(isLoading: true);
  }

  Future<void> _load(String name) async {
    state = state.copyWith(isLoading: true, error: null);

    final useCase = ref.read(getPokemonDetailUseCaseProvider);
    final result = await useCase(name).run();

    if (!ref.mounted) return;

    result.fold((e) => state = state.copyWith(isLoading: false, error: e), (
      detail,
    ) {
      state = state.copyWith(isLoading: false, detail: detail);

      // Populate the type cache so the list screen can filter.
      ref.read(pokemonTypeCacheProvider.notifier).register(name, detail.types);
    });
  }

  void retry() => _load(pokemonName);
}
