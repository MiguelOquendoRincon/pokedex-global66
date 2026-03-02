// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_detail/domain/repositories/pokemon_detail_repository.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/pokemon_details.dart';

abstract interface class IPokemonDetailRepository {
  TaskEither<AppException, PokemonDetail> getPokemonDetail(String name);
}
