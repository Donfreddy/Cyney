import 'package:cyney/core/http/http_client.dart';
import 'package:cyney/core/network/network_info.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_local_data_source.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_remote_data_source.dart';
import 'package:cyney/data/repository/movie_repository_impl.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:cyney/domain/usecases/get_movies_usecase.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Bloc
  locator.registerFactory(() => MoviesBloc(movies: locator()));

  // Use cases
  locator.registerLazySingleton(() => GetMoviesUsecase(locator()));

  // Repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: locator()),
  );

  locator.registerLazySingleton<MoviesLocalDataSource>(
    () => MoviesLocalDataSourceImpl(sharedPreferences: locator()),
  );

  // Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => HttpClient());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
