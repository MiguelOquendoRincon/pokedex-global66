// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
// import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
// import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_card.dart';

// class PokemonList extends ConsumerWidget {
//   const PokemonList({
//     required this.pokemon,
//     required this.typeFilter,
//     required this.isLoadingMore,
//     required this.hasReachedEnd,
//     required this.onLoadMore,
//     super.key,
//   });

//   final List<PokemonSummary> pokemon;
//   final String typeFilter;
//   final bool isLoadingMore;
//   final bool hasReachedEnd;
//   final VoidCallback onLoadMore;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final typeCache = ref.watch(pokemonTypeCacheProvider);

//     final filtered = typeFilter.isEmpty
//         ? pokemon
//         : pokemon.where((p) => typeCache[p.name] == typeFilter).toList();

//     return NotificationListener<ScrollNotification>(
//       onNotification: (n) {
//         if (n is ScrollEndNotification &&
//             n.metrics.extentAfter < 200 &&
//             !isLoadingMore &&
//             !hasReachedEnd) {
//           onLoadMore();
//         }
//         return false;
//       },
//       child: ListView.builder(
//         padding: EdgeInsets.zero,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: filtered.length + (isLoadingMore ? 1 : 0),
//         shrinkWrap: true,
//         itemBuilder: (context, i) {
//           if (i >= filtered.length) {
//             return const _LoadingMoreIndicator();
//           }
//           return PokemonCard(
//             pokemon: filtered[i],
//             primaryType: typeCache[filtered[i].name] ?? '',
//           );
//         },
//       ),
//     );
//   }
// }

// // ── Private Card ──────────────────────────────────────────────────────────────

// // ── Loading-more indicator ─────────────────────────────────────────────────────

// class _LoadingMoreIndicator extends StatelessWidget {
//   const _LoadingMoreIndicator();

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       child: Center(child: CircularProgressIndicator()),
//     );
//   }
// }
