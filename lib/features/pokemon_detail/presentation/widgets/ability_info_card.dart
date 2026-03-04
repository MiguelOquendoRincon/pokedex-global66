import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/providers/ability_translation_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/info_card.dart';

class AbilityInfoCard extends ConsumerWidget {
  const AbilityInfoCard({
    super.key,
    required this.label,
    required this.abilityName,
    required this.icon,
  });

  final String label;
  final String abilityName;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (abilityName.isEmpty || abilityName == '—') {
      return InfoCard(label: label, value: abilityName, icon: icon);
    }

    final translation = ref.watch(abilityTranslationProvider(abilityName));

    final value = translation.maybeWhen(
      data: (data) =>
          data.isEmpty ? data : '${data[0].toUpperCase()}${data.substring(1)}',
      orElse: () => abilityName.isEmpty
          ? abilityName
          : '${abilityName[0].toUpperCase()}${abilityName.substring(1)}',
    );

    return InfoCard(label: label, value: value, icon: icon);
  }
}
