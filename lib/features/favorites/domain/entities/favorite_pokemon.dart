// ══════════════════════════════════════════════════════════════════════════════
// features/favorites/domain/entities/favorite_pokemon.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_pokemon.freezed.dart';

/// Lightweight entity stored locally — only what we need to render the
/// favorites list without hitting the network again.
@freezed
abstract class FavoritePokemon with _$FavoritePokemon {
  const FavoritePokemon._();
  const factory FavoritePokemon({
    required int id,
    required String name,
    required String primaryType,
  }) = _FavoritePokemon;

  /// Creates a [FavoritePokemon] from a string formatted as "id:name:primaryType".
  factory FavoritePokemon.fromStorageString(String raw) {
    final parts = raw.split(':');
    assert(parts.length == 3, 'Malformed favorite storage string: $raw');
    return FavoritePokemon(
      id: int.parse(parts[0]),
      name: parts[1],
      primaryType: parts[2],
    );
  }

  /// Returns the name of the Pokémon with the first letter capitalized.
  String get displayName =>
      name.isEmpty ? name : '${name[0].toUpperCase()}${name.substring(1)}';

  /// Returns the Pokémon's ID formatted as a three-digit string with a leading hash (e.g., #025).
  String get formattedId => '#${id.toString().padLeft(3, '0')}';

  /// Returns the URL for the Pokémon's official artwork or sprite.
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/'
      'sprites/pokemon/$id.png';
}

extension FavoritePokemonX on FavoritePokemon {
  String toStorageString() => '$id:$name:$primaryType';
}
