import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/models/Login_request.dart';
import 'package:e_commerce/features/auth/data/models/Login_response.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/resources/const_manager.dart';
import 'auth_remote_data_source.dart';
@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl:AuthApiConstant.baseUrl) );

  @override
  Future<RegisterResponse> register(RegisterRequest request) async{
   try {
     final response = await dio.post(
        AuthApiConstant.registerEndPoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    }catch (exception) {
     String? message;
     if (exception is DioException){
       message = exception.response?.data['message'];
     }
     throw RemoteException(exception: message ?? 'Failed to register');
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async{
    try {
      final response = await dio.post(
        AuthApiConstant.loginEndPoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    }catch (exception) {
      String? message;
      if (exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(exception: message ?? 'Failed to login');
    }
  }
}