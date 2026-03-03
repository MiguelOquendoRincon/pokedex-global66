import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es'),
    Locale('en'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get appTitle;

  /// Bottom nav label for the Pokémon list tab
  ///
  /// In en, this message translates to:
  /// **'Pokémon'**
  String get navPokemonList;

  /// Bottom nav label for the favorites tab
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// Hint text inside the search bar
  ///
  /// In en, this message translates to:
  /// **'Search Pokémon...'**
  String get searchHint;

  /// Title of the favorites screen
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get favoritesTitle;

  /// Empty-state message on the favorites screen
  ///
  /// In en, this message translates to:
  /// **'No favorites yet.\nTap the ♥ on any Pokémon to save it.'**
  String get favoritesEmpty;

  /// Section label in detail screen
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get detailAbout;

  /// Section label in detail screen
  ///
  /// In en, this message translates to:
  /// **'Base Stats'**
  String get detailBaseStats;

  /// Section label in detail screen
  ///
  /// In en, this message translates to:
  /// **'Abilities'**
  String get detailAbilities;

  /// Label for the height field
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get detailHeight;

  /// Label for the weight field
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get detailWeight;

  /// Label for the base experience field
  ///
  /// In en, this message translates to:
  /// **'Base Exp.'**
  String get detailBaseExp;

  /// Label for the category field
  ///
  /// In en, this message translates to:
  /// **'CATEGORY'**
  String get detailCategory;

  /// Label for the ability field
  ///
  /// In en, this message translates to:
  /// **'ABILITY'**
  String get detailAbility;

  /// Label for the gender section
  ///
  /// In en, this message translates to:
  /// **'GENDER'**
  String get detailGender;

  /// Label for the weaknesses section
  ///
  /// In en, this message translates to:
  /// **'Weaknesses'**
  String get detailWeaknesses;

  /// Shown when Pokémon has no gender
  ///
  /// In en, this message translates to:
  /// **'Genderless'**
  String get detailGenderless;

  /// No description provided for @statHp.
  ///
  /// In en, this message translates to:
  /// **'HP'**
  String get statHp;

  /// No description provided for @statAttack.
  ///
  /// In en, this message translates to:
  /// **'Attack'**
  String get statAttack;

  /// No description provided for @statDefense.
  ///
  /// In en, this message translates to:
  /// **'Defense'**
  String get statDefense;

  /// No description provided for @statSpAtk.
  ///
  /// In en, this message translates to:
  /// **'Sp. Atk'**
  String get statSpAtk;

  /// No description provided for @statSpDef.
  ///
  /// In en, this message translates to:
  /// **'Sp. Def'**
  String get statSpDef;

  /// No description provided for @statSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get statSpeed;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get errorGeneric;

  /// Error message on the Pokémon list screen
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load the information at this time. Check your connection or try again later.'**
  String get pokemonListError;

  /// Shown when the device is offline
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get errorNoInternet;

  /// Shown when the API returns 404
  ///
  /// In en, this message translates to:
  /// **'Pokémon not found.'**
  String get errorNotFound;

  /// Shown on connection timeout
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please try again.'**
  String get errorTimeout;

  /// Shown on 5xx errors
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get errorServer;

  /// Label for the retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// Bottom nav label for regions tab
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get navRegions;

  /// Bottom nav label for profile tab
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// Regions screen title
  ///
  /// In en, this message translates to:
  /// **'Coming Soon!'**
  String get regionsComingSoon;

  /// Regions screen subtitle
  ///
  /// In en, this message translates to:
  /// **'We are working to bring you this section. Come back later to discover all the news.'**
  String get regionsComingSoonSubtitle;

  /// Profile section header
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get profileAppearance;

  /// Dark mode toggle label
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get profileDarkMode;

  /// Profile language section header
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// Language selector label
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get profileSelectLanguage;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get languageEnglish;

  /// Spanish language option
  ///
  /// In en, this message translates to:
  /// **'ES'**
  String get languageSpanish;

  /// Skip onboarding button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// Next onboarding page button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// Final onboarding CTA button
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingStart;

  /// First onboarding page title
  ///
  /// In en, this message translates to:
  /// **'All Pokémon in one place.'**
  String get onboarding1Title;

  /// First onboarding page description
  ///
  /// In en, this message translates to:
  /// **'Access a vast list of Pokémon from every generation created by Nintendo.'**
  String get onboarding1Description;

  /// Second onboarding page title
  ///
  /// In en, this message translates to:
  /// **'Keep your Pokédex updated'**
  String get onboarding2Title;

  /// Second onboarding page description
  ///
  /// In en, this message translates to:
  /// **'Register and save your profile, favorite Pokémon, settings, and more in the app'**
  String get onboarding2Description;

  /// Generic loading indicator label
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingText;

  /// Formatted Pokémon number, e.g. #025
  ///
  /// In en, this message translates to:
  /// **'#{id}'**
  String pokemonNumber(String id);

  /// Snackbar when a Pokémon is favorited
  ///
  /// In en, this message translates to:
  /// **'{name} added to favorites!'**
  String addedToFavorites(String name);

  /// Snackbar when a Pokémon is unfavorited
  ///
  /// In en, this message translates to:
  /// **'{name} removed from favorites.'**
  String removedFromFavorites(String name);

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove from Favorites'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove {name} from your favorites?'**
  String deleteConfirmMessage(Object name);

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get commonDelete;

  /// No description provided for @profileVersion.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get profileVersion;

  /// No description provided for @profileTrainerId.
  ///
  /// In en, this message translates to:
  /// **'Trainer ID'**
  String get profileTrainerId;

  /// No description provided for @profileJoined.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get profileJoined;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['es', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es':
      return AppLocalizationsEs();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
