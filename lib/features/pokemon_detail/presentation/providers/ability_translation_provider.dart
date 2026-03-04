import 'package:pokedex_global66/core/l10n/locale_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/datasource/pokemon_detail_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ability_translation_provider.g.dart';

@Riverpod(keepAlive: true)
Future<String> abilityTranslation(Ref ref, String abilityName) async {
  final language = ref.watch(localeProvider)?.languageCode ?? 'en';
  final datasource = ref.read(pokemonDetailRemoteDatasourceProvider);

  final result = await datasource.fetchAbilityDetails(abilityName).run();

  return result.fold(
    (l) => abilityName, // Fallback to raw name on error
    (model) {
      if (model.names.isEmpty) return model.name;

      final nameEntry =
          model.names.where((n) => n.language.name == language).firstOrNull ??
          model.names.where((n) => n.language.name == 'en').firstOrNull ??
          model.names.first;

      return nameEntry.name;
    },
  );
}
