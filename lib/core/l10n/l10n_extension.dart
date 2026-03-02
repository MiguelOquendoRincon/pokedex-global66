import 'package:flutter/widgets.dart';

import '../l10n/generated/app_localizations.dart';

/// Ergonomic accessor so widgets write `context.l10n.appTitle`
/// instead of `AppLocalizations.of(context).appTitle`.
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
