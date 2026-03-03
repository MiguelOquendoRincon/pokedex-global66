// ══════════════════════════════════════════════════════════════════════════════
// features/profile/presentation/screens/profile_screen.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/l10n/locale_provider.dart';
import 'package:pokedex_global66/core/theme/theme_provider.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);
    final l10n = context.l10n;
    final isDark = themeMode == ThemeMode.dark;
    final colorScheme = Theme.of(context).colorScheme;

    final currentLang = locale?.languageCode ?? 'en';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Header ──────────────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: _ProfileHeader(isDark: isDark),
            ),
            backgroundColor: AppColors.primary,
          ),

          // ── Body ────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Appearance section ─────────────────────────────────────
                  _SectionLabel(l10n.profileAppearance),
                  const SizedBox(height: 12),
                  _SettingsCard(
                    children: [
                      _ThemeRow(
                        label: l10n.profileDarkMode,
                        isDark: isDark,
                        colorScheme: colorScheme,
                        onChanged: (_) =>
                            ref.read(themeProvider.notifier).toggle(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ── Language section ───────────────────────────────────────
                  _SectionLabel(l10n.profileLanguage),
                  const SizedBox(height: 12),
                  _SettingsCard(
                    children: [
                      _LanguageRow(
                        label: l10n.profileSelectLanguage,
                        currentLang: currentLang,
                        colorScheme: colorScheme,
                        onSelectEn: () =>
                            ref.read(localeProvider.notifier).setEnglish(),
                        onSelectEs: () =>
                            ref.read(localeProvider.notifier).setSpanish(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Header ─────────────────────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFDC0A2D), Color(0xFFFF4F6D)],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pokéball watermark
          Positioned(
            right: -30,
            top: -30,
            child: Opacity(
              opacity: 0.08,
              child: Icon(
                Icons.catching_pokemon,
                size: 200,
                color: Colors.white,
              ),
            ),
          ),
          // Avatar + name
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.15),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    size: 52,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Trainer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '✦  Global66 Pokédex  ✦',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.75),
                    fontSize: 13,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section label ──────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}

// ── Card container ─────────────────────────────────────────────────────────────

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(children: children),
      ),
    );
  }
}

// ── Theme toggle row ───────────────────────────────────────────────────────────

class _ThemeRow extends StatelessWidget {
  const _ThemeRow({
    required this.label,
    required this.isDark,
    required this.colorScheme,
    required this.onChanged,
  });

  final String label;
  final bool isDark;
  final ColorScheme colorScheme;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
          key: ValueKey(isDark),
          color: colorScheme.primary,
          size: 26,
        ),
      ),
      title: Text(label),
      trailing: Switch(
        value: isDark,
        onChanged: onChanged,
        activeThumbColor: colorScheme.primary,
      ),
    );
  }
}

// ── Language selector row ──────────────────────────────────────────────────────

class _LanguageRow extends StatelessWidget {
  const _LanguageRow({
    required this.label,
    required this.currentLang,
    required this.colorScheme,
    required this.onSelectEn,
    required this.onSelectEs,
  });

  final String label;
  final String currentLang;
  final ColorScheme colorScheme;
  final VoidCallback onSelectEn;
  final VoidCallback onSelectEs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Icon(
        Icons.language_rounded,
        color: colorScheme.primary,
        size: 26,
      ),
      title: Text(label),
      trailing: _SegmentedLangPicker(
        currentLang: currentLang,
        colorScheme: colorScheme,
        onSelectEn: onSelectEn,
        onSelectEs: onSelectEs,
      ),
    );
  }
}

// ── Segmented language picker ──────────────────────────────────────────────────

class _SegmentedLangPicker extends StatelessWidget {
  const _SegmentedLangPicker({
    required this.currentLang,
    required this.colorScheme,
    required this.onSelectEn,
    required this.onSelectEs,
  });

  final String currentLang;
  final ColorScheme colorScheme;
  final VoidCallback onSelectEn;
  final VoidCallback onSelectEs;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: 'en', label: Text('EN')),
        ButtonSegment(value: 'es', label: Text('ES')),
      ],
      selected: {currentLang},
      onSelectionChanged: (Set<String> selected) {
        if (selected.first == 'en') {
          onSelectEn();
        } else {
          onSelectEs();
        }
      },
      style: SegmentedButton.styleFrom(
        selectedBackgroundColor: AppColors.primary,
        selectedForegroundColor: Colors.white,
        foregroundColor: colorScheme.onSurface,
        side: BorderSide(color: colorScheme.outlineVariant),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        minimumSize: const Size(0, 36),
      ),
    );
  }
}
