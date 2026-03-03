// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pokedex_global66/core/error/app_exception.dart';
// import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
// import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
// import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_error.dart';

// class PokemonListScreen2 extends ConsumerWidget {
//   const PokemonListScreen2({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(pokemonListProvider);
//     final l10n = context.l10n;

//     if (state.error == null && state.allPokemon.isEmpty) {
//       return Scaffold(
//         body: PokemonListError(
//           exception: AppException.unknown(message: ''),
//           onRetry: () {},
//         ),
//       );
//     }

//     return Scaffold(
//       body: PokemonListError(
//         exception: AppException.unknown(message: ''),
//         onRetry: () {
//           ref.read(pokemonListProvider.notifier).retry();
//         },
//       ),
//     );

//     // return Scaffold(
//     //   appBar: state.error == null
//     //       ? AppBar(title: Text(l10n.pokemonListTitle))
//     //       : null,
//     //   body: const Placeholder(),
//     // );
//   }
// }
