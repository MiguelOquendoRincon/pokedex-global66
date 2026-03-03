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

  // Pagination defaults
  static const int defaultPageLimit = 20;
}
