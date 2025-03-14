import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/models/breaking_news_model.dart';

class NewsRepository {
  DioConsumer dioConsumer = DioConsumer();

  Future<List<NewsModel>> getNews(
    String path, {
    dynamic data,
    bool isFormData = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    // try {
      final jsonResponse = await dioConsumer.get(
        path,
        data: data,
        isFormData: isFormData,
        queryParameters: queryParameters,
      );
      List<dynamic> articles = jsonResponse['articles'];
     return articles.map((article) => NewsModel.fromJson(article)).toList();
    // } on Ser verException catch (error) {

    // }
  }
}
