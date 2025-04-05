import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/features/home/data/repositories/news_repository.dart';

final GetIt serviceLocator = GetIt.instance;

void setupDI() {
  serviceLocator.registerLazySingleton<DioConsumer>(() => DioConsumer());
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<NewsRepository>(() => NewsRepository());
}
