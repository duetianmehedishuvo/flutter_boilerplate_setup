import 'package:nahid_ecommerce/datasources/dio_client/dio/dio_client.dart';
import 'package:nahid_ecommerce/datasources/dio_client/exception/api_error_handler.dart';
import 'package:nahid_ecommerce/datasources/model/core/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getDayOne()async{
    try{
      final response=await dioClient.get('https://api.covid19api.com/dayone/country/south-africa/status/confirmed');
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}