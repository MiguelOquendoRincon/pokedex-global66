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
    required int height, // decimetresE
    required int weight, // hectograms
    required int baseExperience,
    required List<String> types,
    required Map<String, int> stats,
    required List<String> abilities,
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
}
