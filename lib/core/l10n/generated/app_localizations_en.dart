// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get navPokemonList => 'Pokedex';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get searchHint => 'Search Pokémon...';

  @override
  String get favoritesTitle => 'My Favorites';

  @override
  String get favoritesEmpty => 'You haven\'t marked any Pokémon as a favorite';

  @override
  String get favoritesEmptySubtitle =>
      'Click the heart icon of your favorites Pokémon and they will appear here.';

  @override
  String get detailAbout => 'About';

  @override
  String get detailBaseStats => 'Base Stats';

  @override
  String get detailAbilities => 'Abilities';

  @override
  String get detailHeight => 'Height';

  @override
  String get detailWeight => 'Weight';

  @override
  String get detailBaseExp => 'Base Exp.';

  @override
  String get detailCategory => 'CATEGORY';

  @override
  String get detailAbility => 'ABILITY';

  @override
  String get detailGender => 'GENDER';

  @override
  String get detailWeaknesses => 'Weaknesses';

  @override
  String get detailGenderless => 'Genderless';

  @override
  String get statHp => 'HP';

  @override
  String get statAttack => 'Attack';

  @override
  String get statDefense => 'Defense';

  @override
  String get statSpAtk => 'Sp. Atk';

  @override
  String get statSpDef => 'Sp. Def';

  @override
  String get statSpeed => 'Speed';

  @override
  String get errorGeneric => 'Something went wrong.';

  @override
  String get pokemonListError =>
      'We couldn\'t load the information at this time. Check your connection or try again later.';

  @override
  String get errorNoInternet => 'No internet connection.';

  @override
  String get errorNotFound => 'Pokémon not found.';

  @override
  String get errorTimeout => 'Request timed out. Please try again.';

  @override
  String get errorServer => 'Server error. Please try again later.';

  @override
  String get retryButton => 'Retry';

  @override
  String get navRegions => 'Regions';

  @override
  String get navProfile => 'Profile';

  @override
  String get regionsComingSoon => 'Coming Soon!';

  @override
  String get regionsComingSoonSubtitle =>
      'We are working to bring you this section. Come back later to discover all the news.';

  @override
  String get profileAppearance => 'Appearance';

  @override
  String get profileDarkMode => 'Dark Mode';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileSelectLanguage => 'App Language';

  @override
  String get languageEnglish => 'EN';

  @override
  String get languageSpanish => 'ES';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingStart => 'Get Started';

  @override
  String get onboarding1Title => 'All Pokémon in one place.';

  @override
  String get onboarding1Description =>
      'Access a vast list of Pokémon from every generation created by Nintendo.';

  @override
  String get onboarding2Title => 'Keep your Pokédex updated';

  @override
  String get onboarding2Description =>
      'Register and save your profile, favorite Pokémon, settings, and more in the app';

  @override
  String get loadingText => 'Loading...';

  @override
  String pokemonNumber(String id) {
    return '#$id';
  }

  @override
  String addedToFavorites(String name) {
    return '$name added to favorites!';
  }

  @override
  String removedFromFavorites(String name) {
    return '$name removed from favorites.';
  }

  @override
  String get deleteConfirmTitle => 'Remove from Favorites';

  @override
  String deleteConfirmMessage(Object name) {
    return 'Are you sure you want to remove $name from your favorites?';
  }

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDelete => 'Remove';

  @override
  String get profileVersion => 'App Version';

  @override
  String get profileTrainerId => 'Trainer ID';

  @override
  String get profileJoined => 'Joined';

  @override
  String get typeBug => 'Bug';

  @override
  String get typeDark => 'Dark';

  @override
  String get typeDragon => 'Dragon';

  @override
  String get typeElectric => 'Electric';

  @override
  String get typeFairy => 'Fairy';

  @override
  String get typeFighting => 'Fighting';

  @override
  String get typeFire => 'Fire';

  @override
  String get typeFlying => 'Flying';

  @override
  String get typeGhost => 'Ghost';

  @override
  String get typeGrass => 'Grass';

  @override
  String get typeGround => 'Ground';

  @override
  String get typeIce => 'Ice';

  @override
  String get typeNormal => 'Normal';

  @override
  String get typePoison => 'Poison';

  @override
  String get typePsychic => 'Psychic';

  @override
  String get typeRock => 'Rock';

  @override
  String get typeSteel => 'Steel';

  @override
  String get typeWater => 'Water';

  @override
  String get filterTitle => 'Filter by your preferences';

  @override
  String get filterType => 'Type';

  @override
  String get filterApply => 'Apply';

  @override
  String get filterCancel => 'Cancel';

  @override
  String resultsFound(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Found ',
      one: 'Found ',
    );
    return '$_temp0';
  }

  @override
  String resultsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count results',
      one: '1 result',
    );
    return '$_temp0';
  }

  @override
  String get clearFilter => 'Clear filter';
}
