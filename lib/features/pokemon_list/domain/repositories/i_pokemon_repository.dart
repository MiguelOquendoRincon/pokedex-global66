// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_list/domain/repositories/i_pokemon_repository.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';

/// Contract between domain and data layer.
/// The domain only knows about [PokemonSummary] and [AppException].
/// Implementations live in the data layer — DIP satisfied
abstract interface class IPokemonRepository {
  TaskEither<AppException, List<PokemonSummary>> getPokemonList({
    required int limit,
    required int offset,
  });
}
