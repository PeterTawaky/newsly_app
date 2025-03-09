import 'package:news_app/core/api/endpoints.dart';

class NewsModel {
  // final String src;
  final String title;
  final String? urlToImage;
  final String? author;
  final String? name;

  NewsModel({
    required this.name,
    required this.title,
    required this.urlToImage,
    required this.author,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      name: json[ApiKey.source][ApiKey.name],
      title: json[ApiKey.title],
      urlToImage: json[ApiKey.urlToImage],
      author: json[ApiKey.author],
    );
  }
}
