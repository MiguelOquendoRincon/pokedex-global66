import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_global66/core/l10n/generated/app_localizations.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/widgets/custom_button.dart';

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
  static const List<String> _types = [
    'bug',
    'dark',
    'dragon',
    'electric',
    'fairy',
    'fighting',
    'fire',
    'flying',
    'ghost',
    'grass',
    'ground',
    'ice',
    'normal',
    'poison',
    'psychic',
    'rock',
    'steel',
    'water',
  ];

  String _getTranslatedType(String type, AppLocalizations l10n) {
    switch (type) {
      case 'bug':
        return l10n.typeBug;
      case 'dark':
        return l10n.typeDark;
      case 'dragon':
        return l10n.typeDragon;
      case 'electric':
        return l10n.typeElectric;
      case 'fairy':
        return l10n.typeFairy;
      case 'fighting':
        return l10n.typeFighting;
      case 'fire':
        return l10n.typeFire;
      case 'flying':
        return l10n.typeFlying;
      case 'ghost':
        return l10n.typeGhost;
      case 'grass':
        return l10n.typeGrass;
      case 'ground':
        return l10n.typeGround;
      case 'ice':
        return l10n.typeIce;
      case 'normal':
        return l10n.typeNormal;
      case 'poison':
        return l10n.typePoison;
      case 'psychic':
        return l10n.typePsychic;
      case 'rock':
        return l10n.typeRock;
      case 'steel':
        return l10n.typeSteel;
      case 'water':
        return l10n.typeWater;
      default:
        return '${type[0].toUpperCase()}${type.substring(1)}';
    }
  }

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
    final l10n = context.l10n;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Drag handle ──────────────────────────────────────────────
              const SizedBox(height: 12),
              IconButton(
                icon: Icon(Icons.close, color: textPrimary, size: 22),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 8),

              // ── Header ───────────────────────────────────────────────────
              Center(
                child: Text(
                  l10n.filterTitle,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),

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
                              AppLocalizations.of(context).filterType,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
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
                        children: _types.map((typeKey) {
                          final isChecked = _selected.contains(typeKey);
                          final typeColor = AppColors.forType(typeKey);
                          final translatedLabel = _getTranslatedType(
                            typeKey,
                            AppLocalizations.of(context),
                          );
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => setState(() {
                                  if (isChecked) {
                                    _selected.remove(typeKey);
                                  } else {
                                    _selected.add(typeKey);
                                  }
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        translatedLabel,
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w400,
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
                      child: CustomButton.primary(
                        onPressed: () => Navigator.pop(context, _selected),
                        text: AppLocalizations.of(context).filterApply,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Cancelar
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: CustomButton.secondary(
                        onPressed: () => Navigator.pop(context),
                        text: AppLocalizations.of(context).filterCancel,
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
