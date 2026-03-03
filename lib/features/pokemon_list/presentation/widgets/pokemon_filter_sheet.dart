import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

// ── Public API ────────────────────────────────────────────────────────────────

/// Opens the filter bottom sheet and returns the selected types,
/// or `null` if the user cancelled.
Future<Set<String>?> showPokemonFilterSheet(
  BuildContext context, {
  Set<String> initialTypes = const {},
}) {
  return showModalBottomSheet<Set<String>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _PokemonFilterSheet(initialTypes: initialTypes),
  );
}

// ── Internal widget ───────────────────────────────────────────────────────────

class _PokemonFilterSheet extends StatefulWidget {
  const _PokemonFilterSheet({required this.initialTypes});
  final Set<String> initialTypes;

  @override
  State<_PokemonFilterSheet> createState() => _PokemonFilterSheetState();
}

class _PokemonFilterSheetState extends State<_PokemonFilterSheet> {
  // All Pokémon types sorted alphabetically (Spanish labels)
  static const List<({String key, String label})> _types = [
    (key: 'bug', label: 'Bicho'),
    (key: 'dark', label: 'Siniestro'),
    (key: 'dragon', label: 'Dragón'),
    (key: 'electric', label: 'Eléctrico'),
    (key: 'fairy', label: 'Hada'),
    (key: 'fighting', label: 'Lucha'),
    (key: 'fire', label: 'Fuego'),
    (key: 'flying', label: 'Volador'),
    (key: 'ghost', label: 'Fantasma'),
    (key: 'grass', label: 'Planta'),
    (key: 'ground', label: 'Tierra'),
    (key: 'ice', label: 'Hielo'),
    (key: 'normal', label: 'Normal'),
    (key: 'poison', label: 'Veneno'),
    (key: 'psychic', label: 'Psíquico'),
    (key: 'rock', label: 'Roca'),
    (key: 'steel', label: 'Acero'),
    (key: 'water', label: 'Agua'),
  ];

  late final Set<String> _selected;
  bool _typeExpanded = true;

  @override
  void initState() {
    super.initState();
    _selected = Set.from(widget.initialTypes);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textPrimary = isDark ? Colors.white : AppColors.textDark;
    final textSecondary = isDark
        ? const Color(0xFF9E9E9E)
        : AppColors.textMedium;
    final divider = isDark ? const Color(0xFF2C2C2C) : const Color(0xFFE0E0E0);

    return DraggableScrollableSheet(
      initialChildSize: 0.88,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // ── Drag handle ──────────────────────────────────────────────
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: textSecondary.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 8),

              // ── Header ───────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: textPrimary, size: 22),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Filtra por tus preferencias',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: textPrimary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 32), // balance close button
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Divider(height: 1, color: divider),

              // ── Scrollable content ───────────────────────────────────────
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 8),

                    // ── Tipo section ─────────────────────────────────────
                    InkWell(
                      onTap: () =>
                          setState(() => _typeExpanded = !_typeExpanded),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          children: [
                            Text(
                              'Tipo',
                              style: GoogleFonts.outfit(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: textPrimary,
                              ),
                            ),
                            const Spacer(),
                            AnimatedRotation(
                              turns: _typeExpanded ? 0 : 0.5,
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: textPrimary,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 1, color: divider),

                    // ── Animated type list ───────────────────────────────
                    AnimatedCrossFade(
                      firstChild: Column(
                        children: _types.map((t) {
                          final isChecked = _selected.contains(t.key);
                          final typeColor = AppColors.forType(t.key);
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => setState(() {
                                  if (isChecked) {
                                    _selected.remove(t.key);
                                  } else {
                                    _selected.add(t.key);
                                  }
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        t.label,
                                        style: GoogleFonts.outfit(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: textPrimary,
                                        ),
                                      ),
                                      const Spacer(),
                                      // Custom styled checkbox
                                      AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 180,
                                        ),
                                        width: 22,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          color: isChecked
                                              ? typeColor
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                          border: Border.all(
                                            color: isChecked
                                                ? typeColor
                                                : textSecondary.withValues(
                                                    alpha: 0.4,
                                                  ),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: isChecked
                                            ? const Icon(
                                                Icons.check,
                                                size: 15,
                                                color: Colors.white,
                                              )
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(height: 1, color: divider),
                            ],
                          );
                        }).toList(),
                      ),
                      secondChild: const SizedBox.shrink(),
                      crossFadeState: _typeExpanded
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 250),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),

              // ── Bottom action buttons ─────────────────────────────────────
              Container(
                padding: EdgeInsets.fromLTRB(
                  20,
                  16,
                  20,
                  MediaQuery.of(context).padding.bottom + 16,
                ),
                decoration: BoxDecoration(
                  color: bg,
                  border: Border(top: BorderSide(color: divider, width: 1)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Aplicar
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, _selected),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'Aplicar',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Cancelar
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          foregroundColor: textPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
