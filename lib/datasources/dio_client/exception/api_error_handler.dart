import 'package:dio/dio.dart';
import 'package:nahid_ecommerce/datasources/model/core/error_response_model.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API Server was Cancelled";
              break;
            case DioErrorType.connectTimeout:
              errorDescription = "Connection Timeout with API Server";
              break;
            case DioErrorType.other:
              errorDescription = "Connection API Server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server.";
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 403:
                  errorDescription = error.response!.data['message'];
                  break;
                default:
                  ErrorResponseModel? errorResponseModel;
                  try {
                    errorResponseModel = ErrorResponseModel.fromJson(error.response!.data);
                  } catch (e) {
                    if (errorResponseModel != null && errorResponseModel.error != null && errorResponseModel.error!.isNotEmpty) {
                      errorDescription = errorResponseModel;
                    } else {
                      errorDescription = 'Failed to load data - status code: ${error.response!.statusCode}';
                    }
                  }
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = 'Send Timeout with server';
              break;
          }
        } else {
          errorDescription = 'Unexpected error occurred';
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = 'is not a subtype of exception';
    }
    return errorDescription;
  }
}
