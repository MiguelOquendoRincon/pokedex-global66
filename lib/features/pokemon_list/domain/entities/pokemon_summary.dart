// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_list/domain/entities/pokemon_summary.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_summary.freezed.dart';

/// Minimal projection of a Pokémon used in the list screen.
/// The domain entity knows nothing about JSON, Dio, or SharedPrefs.
@freezed
abstract class PokemonSummary with _$PokemonSummary {
  const PokemonSummary._();
  const factory PokemonSummary({required int id, required String name}) =
      _PokemonSummary;

  // ── Derived ───────────────────────────────────────────────────────────────

  /// Capitalised display name: "bulbasaur" → "Bulbasaur"
  String get displayName =>
      name.isEmpty ? name : '${name[0].toUpperCase()}${name.substring(1)}';

  /// Zero-padded national-dex number: 1 → "001", 25 → "025"
  String get formattedId => '#${id.toString().padLeft(3, '0')}';

  /// Official artwork URL derived from the Pokémon ID.
  /// Avoids an extra network call just to get the image on the list screen.
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/'
      'sprites/pokemon/other/official-artwork/$id.png';
}
