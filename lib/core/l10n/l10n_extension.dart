import 'package:flutter/widgets.dart';

import '../l10n/generated/app_localizations.dart';

/// Ergonomic accessor so widgets write `context.l10n.appTitle`
/// instead of `AppLocalizations.of(context).appTitle`.
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Presentation helpers that depend on localisation strings.
extension AppLocalizationsHelpers on AppLocalizations {
  /// Returns the localised label for a PokéAPI stat key.
  String localiseStatName(String key) => switch (key) {
    'hp' => statHp,
    'attack' => statAttack,
    'defense' => statDefense,
    'special-attack' => statSpAtk,
    'special-defense' => statSpDef,
    'speed' => statSpeed,
    _ => key,
  };
}
