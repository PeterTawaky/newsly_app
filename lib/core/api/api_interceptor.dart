import 'dart:developer';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor() {
    log('ApiInterceptor initialized');
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //كود هيتنفذ مع كل request
    options.headers.addAll({'Authorization': 'Bearer '});
    super.onRequest(options, handler);
  }
}
