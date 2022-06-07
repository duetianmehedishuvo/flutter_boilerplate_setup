import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse

    debugPrint("<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    debugPrint(" ${response.data.toString()}   -->");

    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    debugPrint("--> ${options.method} ${options.path}");
    debugPrint("Headers: ${options.headers.toString()} ");
    debugPrint("<--: End ");

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("Error: --> ${err.response!.statusCode} ${err.requestOptions.path}");
    super.onError(err, handler);
  }
}
