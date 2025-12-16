import 'package:e_commerce/features/auth/data/models/forget_password_request.dart';

import '../../models/Login_request.dart';
import '../../models/Login_response.dart';
import '../../models/register_request.dart';
import '../../models/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);
  Future<LoginResponse> login(LoginRequest request);
  Future<void> forgetPassword(ForgetPasswordRequest request);
  Future<void> verifyCode(ForgetPasswordRequest request);
  Future<void> resetPassword(ForgetPasswordRequest request);

}