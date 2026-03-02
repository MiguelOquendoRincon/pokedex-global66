// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get navPokemonList => 'Pokémon';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get searchHint => 'Buscar Pokémon...';

  @override
  String get favoritesTitle => 'Mis Favoritos';

  @override
  String get favoritesEmpty =>
      'Aún no tienes favoritos.\nToca el ♥ en cualquier Pokémon para guardarlo.';

  @override
  String get detailAbout => 'Acerca de';

  @override
  String get detailBaseStats => 'Estadísticas';

  @override
  String get detailAbilities => 'Habilidades';

  @override
  String get detailHeight => 'Altura';

  @override
  String get detailWeight => 'Peso';

  @override
  String get detailBaseExp => 'Exp. Base';

  @override
  String get statHp => 'PS';

  @override
  String get statAttack => 'Ataque';

  @override
  String get statDefense => 'Defensa';

  @override
  String get statSpAtk => 'At. Esp.';

  @override
  String get statSpDef => 'Def. Esp.';

  @override
  String get statSpeed => 'Velocidad';

  @override
  String get errorGeneric => 'Algo salió mal.';

  @override
  String get errorNoInternet => 'Sin conexión a internet.';

  @override
  String get errorNotFound => 'Pokémon no encontrado.';

  @override
  String get errorTimeout => 'La solicitud tardó demasiado. Intenta de nuevo.';

  @override
  String get errorServer => 'Error del servidor. Intenta más tarde.';

  @override
  String get retryButton => 'Reintentar';

  @override
  String get loadingText => 'Cargando...';

  @override
  String pokemonNumber(String id) {
    return '#$id';
  }

  @override
  String addedToFavorites(String name) {
    return '¡$name agregado a favoritos!';
  }

  @override
  String removedFromFavorites(String name) {
    return '$name eliminado de favoritos.';
  }
}
