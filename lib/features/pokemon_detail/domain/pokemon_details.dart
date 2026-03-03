// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_detail/domain/entities/pokemon_detail.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details.freezed.dart';

@freezed
abstract class PokemonDetail with _$PokemonDetail {
  const PokemonDetail._();
  const factory PokemonDetail({
    required int id,
    required String name,
    required int height, // decimetres
    required int weight, // hectograms
    required int baseExperience,
    required List<String> types,
    required Map<String, int> stats,
    required List<String> abilities,
    required List<String> weaknesses,
    required String description,
    required String category,
    required int genderRate, // -1: genderless, 0..8: female rate in eighths
    String? imageUrl,
  }) = _PokemonDetail;

  // ── Derived ───────────────────────────────────────────────────────────────

  String get displayName =>
      name.isEmpty ? name : '${name[0].toUpperCase()}${name.substring(1)}';

  String get formattedId => '#${id.toString().padLeft(3, '0')}';

  /// Height in metres: 7 dm → "0.7 m"
  String get heightFormatted => '${(height / 10).toStringAsFixed(1)} m';

  /// Weight in kg: 69 hg → "6.9 kg"
  String get weightFormatted => '${(weight / 10).toStringAsFixed(1)} kg';

  /// Primary type (first in the list).
  String get primaryType => types.isNotEmpty ? types.first : 'normal';

  /// Convenience getter used by the stats bar widget.
  int statValue(String statName) => stats[statName] ?? 0;

  /// Male percentage (0–100). Only meaningful when [genderRate] != -1.
  double get malePct =>
      double.parse((((8 - genderRate) / 8) * 100).toStringAsFixed(1));

  /// Female percentage (0–100). Only meaningful when [genderRate] != -1.
  double get femalePct =>
      double.parse(((genderRate / 8) * 100).toStringAsFixed(1));

  /// True if this Pokémon has no gender.
  bool get isGenderless => genderRate == -1;

  /// First ability, capitalised. Returns '—' if the list is empty.
  String get primaryAbility {
    if (abilities.isEmpty) return '—';
    final a = abilities.first;
    return a.isEmpty ? a : '${a[0].toUpperCase()}${a.substring(1)}';
  }
}
