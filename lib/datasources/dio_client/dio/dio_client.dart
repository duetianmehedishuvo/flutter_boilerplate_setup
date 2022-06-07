import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nahid_ecommerce/datasources/dio_client/dio/logging_interceptor.dart';
import 'package:nahid_ecommerce/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final String? baseURL;
  final LoggingInterceptor? loggingInterceptor;
  final SharedPreferences? sharedPreferences;
  Dio? dio;
  String? token;

  DioClient(this.baseURL, Dio dioC, {this.loggingInterceptor, this.sharedPreferences}) {
    token = sharedPreferences!.getString(AppConstant.token);
    dio = dioC;
    dio!
      ..options.baseUrl = baseURL!
      ..options.connectTimeout = 3000
      ..options.receiveTimeout = 3000
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
    dio!.interceptors.add(loggingInterceptor!);
  }

  Future<Response> get(String uri,
      {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? progressCallback}) async {
    try {
      var response = dio!.get(uri, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: progressCallback);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      throw FormatException(e.toString());
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      var response = dio!.post(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to progress the Data');
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> put(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      var response = dio!.put(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to progress the Data');
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> delete(String uri, {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      var response = dio!.delete(uri, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to progress the Data');
    } catch (e) {
      throw e.toString();
    }
  }
}
