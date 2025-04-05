import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/api/endpoints.dart';
import 'package:news_app/core/dependencies/di_container.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/features/home/data/models/breaking_news_model.dart';
import 'package:news_app/features/home/data/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial()) {
    log('NewsCubit initialized');
  }
  NewsRepository newsRepository =
      serviceLocator<NewsRepository>(); //dependency injection
  void getNews({required String endPoint, required String q}) async {
    List<NewsModel> newsList = [];
    try {
      emit(NewsLoading());
      newsList = await newsRepository.getNews(
        endPoint,
        queryParameters: {ApiKey.q: q, ApiKey.apiKey: dotenv.env['API_KEY']},
      );
      emit(NewsLoaded(newsList: newsList));
    } on ServerException catch (e) {
      emit(NewsError());
    }
  }
}
// callGetBreakingNews() async {
//     try {
//       breakingNews = await NewsRepository().getNews(
//         Endpoints.topHeadlines,
//         queryParameters: {
//           ApiKey.apiKey: dotenv.env['API_KEY'],
//           ApiKey.q: 'trend',
//         },
//       );
//       setState(() {
//         dataHere = true;
//       });
//     } on ServerException catch (e) {
//       log(e.errorModel.message);
//     }
//     // await NewsService.getBreakingNews(q: 'trend');
//   }