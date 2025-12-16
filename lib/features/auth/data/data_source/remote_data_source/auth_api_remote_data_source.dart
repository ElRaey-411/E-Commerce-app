import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/models/Login_request.dart';
import 'package:e_commerce/features/auth/data/models/Login_response.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/handle_dio_errors.dart';
import '../../../../../core/resources/const_manager.dart';
import '../../models/forget_password_request.dart';
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
     String message;
     if (exception is DioException) {
       message = handleDioError(exception);
     } else {
       message = 'Failed to register Please try again.';
     }
     throw RemoteException(exception: message);
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
      String message;
      if (exception is DioException) {
        message = handleDioError(exception);
      } else {
        message = 'Failed to login Please try again.';
      }
      throw RemoteException(exception: message);
    }
  }

  @override
  Future<void> forgetPassword(ForgetPasswordRequest request)async {
    try {
       await dio.post(
        AuthApiConstant.forgetPasswordEndPoint,
        data: request.emailToJson(),
      );
    }catch (exception) {
      String message;
      if (exception is DioException) {
        if (exception.response?.statusCode == 404) {
          message = 'There is no user registered with this email address.';
        } else {
          message = handleDioError(exception);
        }
      } else {
        message = 'Something went wrong. Please try again.';
      }
      throw RemoteException(exception: message);
    }

  }

  @override
  Future<void> verifyCode(ForgetPasswordRequest request) async{
    try {
      await dio.post(
        AuthApiConstant.verifyCodeEndPoint,
        data: request.resetCodeToJson(),
      );
    }catch (exception) {
      String message;
      if (exception is DioException) {
        if (exception.response?.statusCode == 400) {
          message = 'Reset code is invalid or has expired';
        } else {
          message = handleDioError(exception);
        }
      } else {
        message = 'Something went wrong. Please try again.';
      }
      throw RemoteException(exception: message);
    }
  }

  @override
  Future<void> resetPassword(ForgetPasswordRequest request)async {
    try {
      await dio.put(
        AuthApiConstant.resetPasswordEndPoint,
        data: request.resetPasswordToJson(),
      );
    }catch (exception) {
      String message;
      if (exception is DioException) {
        message = handleDioError(exception);
      } else {
        message = 'Something went wrong. Please try again.';
      }
      throw RemoteException(exception: message);
    }
  }

}