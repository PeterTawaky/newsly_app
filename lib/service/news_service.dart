import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/helper/api.dart';
import 'package:news_app/models/breaking_news_model.dart';

class NewsService {
  static Dio dio = Dio();
  NewsService._();

  static const String baseUrl = 'https://newsapi.org/v2';
  static const String apiKey = 'fde5a16a615f45978a05b8593dba9ed6';
  static Future<List<NewsModel>> getBreakingNews({required String q}) async {
    List<NewsModel> breakingNews = [];
    var response = await Api().get(
      url: '$baseUrl/top-headlines?q=$q&apiKey=$apiKey',
    );
    List<dynamic> articles = response['articles'];
    for (var article in articles) {
      breakingNews.add(
        NewsModel.fromJson(article),
      ); //send json object receive model dart
    }
    return breakingNews;
  }
}
