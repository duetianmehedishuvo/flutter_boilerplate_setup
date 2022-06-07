import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nahid_ecommerce/datasources/dio_client/dio/dio_client.dart';
import 'package:nahid_ecommerce/datasources/dio_client/dio/logging_interceptor.dart';
import 'package:nahid_ecommerce/datasources/repository/auth_repo.dart';
import 'package:nahid_ecommerce/provider/auth_provider.dart';
import 'package:nahid_ecommerce/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // core
  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
