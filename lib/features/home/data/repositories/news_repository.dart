import '../../../../core/api/dio_consumer.dart';
import '../../../../core/dependencies/di_container.dart';
import '../models/breaking_news_model.dart';

class NewsRepository {
  DioConsumer dioConsumer =
      serviceLocator<DioConsumer>(); //dependency injection
          
  Future<List<NewsModel>> getNews(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final jsonResponse = await dioConsumer.get(
      path,
      queryParameters: queryParameters,
    );
    List<dynamic> articles = jsonResponse['articles'];
    return articles.map((article) => NewsModel.fromJson(article)).toList();
  }
}








// class NewsRepository {
//   List<dynamic>? _articles; // Make it private with _
//   final DioConsumer dioConsumer = serviceLocator<DioConsumer>();

//   Future<List<NewsModel>> getNews(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     bool forceRefresh = false, // Optional parameter to force refresh
//   }) async {
//     // Return cached data if it exists and we're not forcing a refresh
//     if (_articles != null && !forceRefresh) {
//       return _articles!.map((article) => NewsModel.fromJson(article)).toList();
//     }

//     // Fetch new data
//     final jsonResponse = await dioConsumer.get(
//       path,
//       queryParameters: queryParameters,
//     );
    
//     // Cache the new data
//     _articles = jsonResponse['articles'] as List<dynamic>;
    
//     return _articles!.map((article) => NewsModel.fromJson(article)).toList();
//   }

//   // Optional: Add a method to clear cache
//   void clearCache() {
//     _articles = null;
//   }
// }