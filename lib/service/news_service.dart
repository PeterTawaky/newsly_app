import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/models/breaking_news_model.dart';

class NewsService {
  static Dio dio = Dio();
  NewsService._();

  static const String baseUrl = 'https://newsapi.org/v2';
  static const String apiKey = 'fde5a16a615f45978a05b8593dba9ed6';
  static Future<List<BreakingNewsModel>> getBreakingNews({
    required String q,
  }) async {
    try {
      List<BreakingNewsModel> breakingNews = [];
      var response = await dio.get(
        '$baseUrl/top-headlines?q=$q&apiKey=$apiKey',
      );
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];
      for (var article in articles) {
        breakingNews.add(
          BreakingNewsModel.fromJson(article),
        ); //send json object receive model dart
      }
      return breakingNews;
    } on DioException catch (error) {
      log('Error in getBreakingNews: $error');
      final String errorMessage =
          error.response?.data['error']['message'] ??
          "oops something went wrong";
      throw Exception(errorMessage);
    } catch (error) {
      log('Error in getBreakingNews: $error');
      throw Exception('oops something went wrong');
    }
  }
}
