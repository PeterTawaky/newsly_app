import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/api/api_interceptor.dart';
import 'package:news_app/core/api/endpoints.dart';
import 'package:news_app/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio = Dio();

  DioConsumer() {
    //control the dio
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.interceptors.add(ApiInterceptor()); //هيتنفذ مع كل request
    dio.interceptors.add(
      LogInterceptor(
        //print all my request details
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final Response resopnse = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return resopnse.data; //json data
    } on DioException catch (error) {
      handleDioExceptions(error);
    }
  }

  @override
  Future get(
    String path, {
    dynamic data,
    bool isFormData = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response resopnse = await dio.get(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );

      return resopnse.data; //json data
    } on DioException catch (error) {
      handleDioExceptions(error);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final Response resopnse = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return resopnse.data; //json data
    } on DioException catch (error) {
      handleDioExceptions(error);
    }
  }

  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final Response resopnse = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return resopnse.data; //json data
    } on DioException catch (error) {
      handleDioExceptions(error);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final Response resopnse = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return resopnse.data; //json data
    } on DioException catch (error) {
      handleDioExceptions(error);
    }
  }
}
