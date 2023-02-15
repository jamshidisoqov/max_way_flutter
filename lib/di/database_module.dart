import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:max_way_flutter/data/remote/max_way_api.dart';
import 'package:max_way_flutter/domain/repository/max_way_repository.dart';

final getIt = GetIt.instance;

void setUpDatabaseModule() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: "https://maxway.uz/")));
  getIt.registerLazySingleton<MaxWayApi>(() => MaxWayApi(getIt.get()));
  getIt.registerLazySingleton<MaxWayRepository>(() => MaxWayRepository(getIt.get()));
}
