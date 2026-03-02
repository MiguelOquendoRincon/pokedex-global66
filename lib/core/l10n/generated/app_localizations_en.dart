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
  String get navPokemonList => 'Pokémon';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get searchHint => 'Search Pokémon...';

  @override
  String get favoritesTitle => 'My Favorites';

  @override
  String get favoritesEmpty =>
      'No favorites yet.\nTap the ♥ on any Pokémon to save it.';

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
}
