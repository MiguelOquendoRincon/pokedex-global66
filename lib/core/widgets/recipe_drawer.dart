// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_finder_app/core/services/injection_container.dart';
// import 'package:recipe_finder_app/core/theme/app_colors.dart';
// import 'package:recipe_finder_app/core/utils/utils.dart';

// import '../../features/favorites/domain/repositories/favorite_meals_repository.dart';
// import '../../features/favorites/presentation/pages/favorite_meals_page.dart';
// import '../../features/profile/domain/repositories/profile_repository.dart';
// import '../../features/profile/presentation/pages/profile_page.dart';
// import '../../features/splash/presentation/pages/splash_screen.dart';
// import '../utils/text_styles/global_text_styles.dart';

// /// RecipeDrawer widget
// /// This widget provides a navigation drawer for the Recipe Finder application.
// class RecipeDrawer extends StatelessWidget {
//   const RecipeDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     final profileRepository = sl<ProfileRepository>();
//     final favoritesRepository = sl<FavoriteMealsRepository>();

//     return Drawer(
//       child: Column(
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(color: AppColors.orange40),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Recipe Finder 🍲',
//                 style: GlobalTextStyles.h2Heading(context),
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(CupertinoIcons.heart),
//             title: const Text('Favorites'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const FavoriteMealsPage()),
//               );
//             },
//           ),
//           Divider(),
//           ListTile(
//             leading: const Icon(CupertinoIcons.person),
//             title: const Text('Profile'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const ProfilePage()),
//               );
//             },
//           ),
//           Divider(),
//           ListTile(
//             leading: const Icon(CupertinoIcons.delete),
//             title: const Text('Reset App'),
//             onTap: () async {
//               Get.dialog(
//                 CupertinoAlertDialog(
//                   title: const Text('Reset App'),
//                   content: const Text(
//                     'Are you sure you want to reset the app? This will clear all data.',
//                   ),
//                   actions: [
//                     CupertinoDialogAction(
//                       child: Text(
//                         'Cancel',
//                         style: GlobalTextStyles.mediumBody(context),
//                       ),
//                       onPressed: () => Get.back(),
//                     ),
//                     CupertinoDialogAction(
//                       child: Text(
//                         'Reset',
//                         style: GlobalTextStyles.mediumBody(
//                           context,
//                         ).copyWith(color: AppColors.red80),
//                       ),
//                       onPressed: () async {
//                         await profileRepository.deleteProfile();
//                         await favoritesRepository.clearFavorites();
//                         Get.snackbar(
//                           'App Reset',
//                           'The app has been reset successfully.',
//                           backgroundColor: AppColors.white,
//                         );
//                         Get.offAll(() => const SplashPage());
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           const Spacer(),
//           FutureBuilder<String>(
//             future: getAppVersion(),
//             builder: (context, snapshot) {
//               return ListTile(
//                 leading: const Icon(CupertinoIcons.info),
//                 title: Text('App version', style: theme.textTheme.bodySmall),
//                 subtitle: Text(
//                   snapshot.data ?? 'Loading...',
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
