import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await Dio().get(
        url,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (error) {
      log(error.toString());
      throw Exception('there is a problem ${error.toString()}');
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('there is a problem ${error.toString()}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response response = await Dio().post(
        url,
        options: Options(headers: headers),
        data: body,
      );
      return response.data;
    } on DioException catch (error) {
      log(error.toString());
      throw Exception('there is a problem ${error.toString()}');
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('there is a problem ${error.toString()}');
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url body = $body token = $token ');

    try {
      Response response = await Dio().put(
        url,
        options: Options(headers: headers),
        data: body,
      );
      return response.data;
    } on DioException catch (error) {
      log(error.toString());
      throw Exception('there is a problem ${error.toString()}');
    } on Exception catch (error) {
      log(error.toString());
      throw Exception('there is a problem ${error.toString()}');
    }
  }
}
