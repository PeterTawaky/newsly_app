import 'dart:developer';

import 'package:dio/dio.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'endpoints.dart';
import '../dependencies/di_container.dart';
import '../errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio = serviceLocator<Dio>(); //dependency injection

  DioConsumer() {
    log('DioConsumer initialized');
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
        // responseHeader: true,
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
      final Response response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data; //json data
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
      final Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );

      return response.data; //json data
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
      final Response response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data; //json data
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
      final Response response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data; //json data
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
      final Response response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data; //json data
    } on DioException catch (error) {
      handleDioExceptions(error);
    }
  }
}
