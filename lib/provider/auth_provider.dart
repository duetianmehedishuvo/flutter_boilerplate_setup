import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nahid_ecommerce/datasources/model/core/api_response.dart';
import 'package:nahid_ecommerce/datasources/repository/auth_repo.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  getDayOneData()async{
    ApiResponse apiResponse=await authRepo.getDayOne();
    if(apiResponse.response!=null && apiResponse.response!.statusCode==200){
      print(apiResponse.response!.data.toString());
    }else{
      print('shuvo ${apiResponse.error.toString()}');
    }
  }

}
