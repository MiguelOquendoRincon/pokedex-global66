// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_list/domain/entities/pokemon_summary.dart
// ══════════════════════════════════════════════════════════════════════════════

/// Lean domain entity – only what the UI/use-cases need from the list endpoint.
class PokemonSummary {
  const PokemonSummary({required this.id, required this.name});

  final int id;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonSummary &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => Object.hash(id, name);

  @override
  String toString() => 'PokemonSummary(id: $id, name: $name)';
}
