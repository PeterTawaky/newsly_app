import 'package:dio/dio.dart';
import 'package:news_app/models/breaking_news_model.dart';

class NewsService {
  static Dio dio = Dio(
    // BaseOptions(baseUrl: )
  );
  String baseUrl = 'https://newsapi.org/v2/';
  NewsService._();
  static Future<List<BreakingNewsModel>> getBreakingNews({
    required String q,
  }) async {
    try {
      List<BreakingNewsModel> breakingNews = [];
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?q=$q&apiKey=fde5a16a615f45978a05b8593dba9ed6',
      );
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];
      for (var article in articles) {
        breakingNews.add(
          BreakingNewsModel.fromJson(article),
        ); //send json object receive model dart
      }
      return breakingNews;
    } catch (e) {
      return [];
    }
  }
}
