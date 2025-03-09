import 'package:news_app/core/api/endpoints.dart';

class ErrorModel {
  //changes according to the api response
  final String status;
  final String code;
  final String message;

  ErrorModel({required this.status, required this.code, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKey.status],
      code: json[ApiKey.code],
      message: json[ApiKey.message],
    );
  }
}
