// ══════════════════════════════════════════════════════════════════════════════
// features/profile/presentation/screens/profile_screen.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/l10n/locale_provider.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/theme_provider.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/profile/presentation/providers/profile_providers.dart';

/// A screen that displays the user's profile and application settings.
///
/// It allows users to view their trainer status, toggle dark mode,
/// change the application language, and view version information.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);
    final l10n = context.l10n;
    final isDark = themeMode == ThemeMode.dark;
    final packageInfo = ref.watch(packageInfoProvider);

    final currentLang = locale?.languageCode ?? 'en';

    return Scaffold(
      backgroundColor: isDark ? AppColorsDark.surface : AppColors.onPrimary,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Premium Header ──────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.primary,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: _ProfileHeader(isDark: isDark),
            ),
          ),

          // ── Body ────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),

                  // ── Trainer Info Card ──────────────────────────────────────
                  _TrainerStats(l10n: l10n),

                  const SizedBox(height: 32),

                  // ── Appearance Section ─────────────────────────────────────
                  _SectionHeader(title: l10n.profileAppearance),
                  const SizedBox(height: 12),
                  _SettingsContainer(
                    children: [
                      _SettingRow(
                        icon: isDark
                            ? CupertinoIcons.moon_fill
                            : CupertinoIcons.sun_max_fill,
                        label: l10n.profileDarkMode,
                        trailing: CupertinoSwitch(
                          value: isDark,
                          onChanged: (_) =>
                              ref.read(themeProvider.notifier).toggle(),
                          activeTrackColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // ── Language Section ───────────────────────────────────────
                  _SectionHeader(title: l10n.profileLanguage),
                  const SizedBox(height: 12),
                  _SettingsContainer(
                    children: [
                      _SettingRow(
                        icon: CupertinoIcons.globe,
                        label: l10n.profileSelectLanguage,
                        trailing: _LanguagePicker(
                          currentLang: currentLang,
                          onSelectEn: () =>
                              ref.read(localeProvider.notifier).setEnglish(),
                          onSelectEs: () =>
                              ref.read(localeProvider.notifier).setSpanish(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ── Version Branding ───────────────────────────────────────
                  Center(
                    child: Column(
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Icon(
                            Icons.catching_pokemon,
                            size: 40,
                            color: isDark ? Colors.white : AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        packageInfo.when(
                          data: (info) => Text(
                            '${l10n.profileVersion}: ${info.version} (${info.buildNumber})',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          error: (_, _) => const SizedBox.shrink(),
                          loading: () =>
                              const CupertinoActivityIndicator(radius: 8),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '© 2026 Global66 Pokédex',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white24 : AppColors.gray30,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.8)],
        ),
      ),
      child: Stack(
        children: [
          // Pattern Overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/images/pokeball_pattern.png',
                repeat: ImageRepeat.repeat,
                fit: BoxFit.none,
                scale: 4,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Avatar with Glow
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.person_fill,
                        size: 50,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Pokémon Master',
                  style: context.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'Global66 Elite Trainer',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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

class _TrainerStats extends StatelessWidget {
  const _TrainerStats({required this.l10n});
  final dynamic l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _StatItem(label: l10n.profileTrainerId, value: '#8866'),
          Container(height: 40, width: 1, color: AppColors.gray10),
          _StatItem(label: l10n.profileJoined, value: 'Mar 2026'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.textMedium,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: AppColors.primary,
      ),
    );
  }
}

class _SettingsContainer extends StatelessWidget {
  const _SettingsContainer({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }
}

class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.icon,
    required this.label,
    required this.trailing,
  });
  final IconData icon;
  final String label;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _LanguagePicker extends StatelessWidget {
  const _LanguagePicker({
    required this.currentLang,
    required this.onSelectEn,
    required this.onSelectEs,
  });
  final String currentLang;
  final VoidCallback onSelectEn;
  final VoidCallback onSelectEs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LangToggle(
          label: 'EN',
          isActive: currentLang == 'en',
          onTap: onSelectEn,
        ),
        const SizedBox(width: 8),
        _LangToggle(
          label: 'ES',
          isActive: currentLang == 'es',
          onTap: onSelectEs,
        ),
      ],
    );
  }
}

class _LangToggle extends StatelessWidget {
  const _LangToggle({
    required this.label,
    required this.isActive,
    required this.onTap,
  });
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.gray10,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: isActive ? Colors.white : AppColors.textMedium,
          ),
        ),
      ),
    );
  }
}
