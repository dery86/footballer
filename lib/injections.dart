

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:footballer/infrastructure/datasources/fixtures_remote_data_source.dart';
import 'package:footballer/infrastructure/datasources/lineups_remote_data_source.dart';
import 'package:footballer/infrastructure/repositories/fixtures_repository.dart';
import 'package:footballer/infrastructure/repositories/lineups_repository.dart';
import 'package:footballer/presentation/fixtures/bloc/bloc.dart';
import 'package:footballer/presentation/lineups/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import 'common/config.dart';


final getIt = GetIt.instance;

Future init() async {
  //network
  getIt.registerLazySingleton(() => getMainNetworkObj(),);

  //data sources
  getIt.registerLazySingleton(() => FixturesRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => LineupsRemoteDataSource(getIt()));

  //repositories
  getIt.registerLazySingleton(() => FixturesRepository(getIt()));
  getIt.registerLazySingleton(() => LineupsRepository(getIt()));

  //blocs
  getIt.registerFactory(() => FixturesBloc(getIt()),);
  getIt.registerFactory(() => LineupsBloc(getIt()),);

}

Dio getMainNetworkObj() {
  BaseOptions options = BaseOptions(
    baseUrl: Urls.baseUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );
  Dio dio = Dio();
  dio.options = options;
  dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: Urls.baseUrl)).interceptor);
  dio.interceptors.add(QueuedInterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers["x-rapidapi-key"] = ApiCredentials.apiKey;
      options.headers["x-rapidapi-host"] = ApiCredentials.host;
      return handler.next(options);
    },
    onError: (e, handler) async {

      return handler.next(e);
    },
    onResponse: (response, handler) {

      return handler.next(response);
    },
  ));
  return dio;
}


