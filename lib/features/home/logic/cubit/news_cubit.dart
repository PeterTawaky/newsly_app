import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/home/data/models/breaking_news_model.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/dependencies/di_container.dart';
import '../../data/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial()) {
    log('NewsCubit initialized');
  }
  NewsRepository newsRepository =
      serviceLocator<NewsRepository>(); //dependency injection
  void getNews({
    required String endPoint,
    required String q,
    //  bool forceRefresh = false
  }) async {
    emit(NewsLoading());
    final response = await newsRepository.getNews(
      endPoint,
      queryParameters: {ApiKey.q: q, ApiKey.apiKey: dotenv.env['API_KEY']},
      // forceRefresh: forceRefresh
    );
    emit(NewsLoaded(newsList: response));
  }
}
