import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/weather/data/datasources/weather_service.dart';
import 'features/weather/domain/repositories/weather_repository.dart';
import 'features/weather/presentation/cubit/weather_cubit.dart';
import 'features/weather/data/repositories/weather_repository_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // External
  getIt.registerLazySingleton(() => Dio());

  // Services
  getIt.registerLazySingleton(() => WeatherService(getIt()));

  // Repositories
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(getIt()),
  );

  // Cubits
  getIt.registerFactory(() => WeatherCubit(getIt()));
}
