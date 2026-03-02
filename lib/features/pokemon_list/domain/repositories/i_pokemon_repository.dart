// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_list/domain/repositories/i_pokemon_repository.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';

/// Domain contract – the data layer must fulfil this without the domain
/// knowing any implementation details (DIP).
abstract interface class IPokemonRepository {
  TaskEither<AppException, List<PokemonSummary>> getPokemonList({
    required int limit,
    required int offset,
  });
}
