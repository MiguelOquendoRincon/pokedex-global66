/// Centralized collection of API-related constants and configuration.
///
/// This class provides the base URL, timeout durations, and endpoint paths
/// used throughout the application to interact with the PokéAPI.
abstract final class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://pokeapi.co/api/v2/';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // Endpoints
  static const String pokemonList = 'pokemon';
  static String pokemonDetail(String name) => 'pokemon/$name';
  static String pokemonSpecies(int id) => 'pokemon-species/$id';
  static String typeDetail(String typeName) => 'type/$typeName';
  static String abilityDetail(String nameOrId) => 'ability/$nameOrId';

  // Pagination defaults
  static const int splashPreloadLimit = 10;
  static const int defaultPageLimit = 20;
}
