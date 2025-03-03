import 'package:flutter/foundation.dart';

class BreakingNewsModel {
  // final String src;
  final String title;
  final String? urlToImage;
  final String? author;
  final String? name;

  BreakingNewsModel( {required this.name,required this.title, required this.urlToImage, required this.author});

factory BreakingNewsModel.fromJson(Map<String,dynamic> json){
  return BreakingNewsModel(
    name: json['source']['name'],
    title: json['title'],
    urlToImage: json['urlToImage'],author: json['author']);
}
}


