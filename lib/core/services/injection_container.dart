import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_global66/core/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service locator instance
/// This instance is used to register and retrieve dependencies throughout the application.
final sl = GetIt.instance;

/// Function to initialize the service locator
/// This function sets up the dependencies for the application using GetIt.
Future<void> init() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive models
  // Hive.registerAdapter(MealHiveModelAdapter());

  // Open Hive boxes
  // final mealBox = await Hive.openBox<MealHiveModel>('favoriteMeals');

  // sl.registerSingleton<Box<MealHiveModel>>(mealBox);

  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => UserPreferences(prefs));

  // Dio
  // sl.registerLazySingleton(() => DioHandler());

  //** Location Feature */
  // Data source
  // sl.registerLazySingleton<LocationPermissionDataSource>(
  //   () => LocationPermissionDataSource(),
  // );
  // sl.registerLazySingleton<LocationDataSource>(() => LocationDataSource());

  // // Repository
  // sl.registerLazySingleton<LocationPermissionRepository>(
  //   () => LocationPermissionRepositoryImpl(sl()),
  // );
  // sl.registerLazySingleton<LocationRepository>(
  //   () => LocationRepositoryImpl(
  //     sl<LocationDataSource>(),
  //     sl<LocationPermissionRepository>() as LocationPermissionRepositoryImpl,
  //   ),
  // );

  // Use cases
  // sl.registerFactory(() => CheckLocationPermission(sl()));
  // sl.registerFactory(() => RequestLocationPermission(sl()));
  // sl.registerFactory(() => CheckLocationServicesEnabled(sl()));
  // sl.registerFactory(() => OpenAppSettings(sl()));
  // sl.registerFactory(() => GetCurrentPosition(sl<LocationRepository>()));
  // sl.registerFactory(() => ReverseGeocodePosition(sl<LocationRepository>()));

  // Cubit
  // sl.registerFactory(
  //   () => LocationPermissionCubit(
  //     sl<CheckLocationPermission>(),
  //     sl<RequestLocationPermission>(),
  //     sl<CheckLocationServicesEnabled>(),
  //     sl<OpenAppSettings>(),
  //   ),
  // );
  // sl.registerFactory(
  //   () => PositionCubit(sl<GetCurrentPosition>(), sl<ReverseGeocodePosition>()),
  // );

  //** Orders Feature */
  // Data source
  // sl.registerLazySingleton<OrdersDatasource>(() => OrdersDbDatasource());

  // Repository
  // sl.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl(sl()));

  // Use cases
  // sl.registerFactory(() => OrderHistoryUseCase(sl()));

  // Cubit
  // sl.registerLazySingleton<OrderHistoryCubit>(
  //   () => OrderHistoryCubit(loadMyOrdersSummaryUseCase: sl()),
  // );

  // Repositorio
  // sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(sl()));

  // RemoteDataSource
  // sl.registerLazySingleton(() => RecipeRemoteDataSource(sl()));

  // UseCases
  // sl.registerLazySingleton(() => GetFavoriteMealsUseCase(sl()));

  // Cubits
  // sl.registerLazySingleton(() => CategoryCubit(sl())..loadCategories());
}
