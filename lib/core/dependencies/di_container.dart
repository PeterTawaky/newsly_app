import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../api/dio_consumer.dart';
import '../../features/home/data/repositories/news_repository.dart';

final GetIt serviceLocator = GetIt.instance;

void setupDI() {
  serviceLocator.registerLazySingleton<DioConsumer>(() => DioConsumer());
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<NewsRepository>(() => NewsRepository());
}
