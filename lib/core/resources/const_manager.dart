abstract class AuthApiConstant{
  static const String baseUrl = "https://ecommerce.routemisr.com/api/v1";
  static const String registerEndPoint = "/auth/signup";
  static const String loginEndPoint = "/auth/signin";
  static const String forgetPasswordEndPoint = "/auth/forgotPasswords";
  static const String verifyCodeEndPoint = "/auth/verifyResetCode";
  static const String resetPasswordEndPoint = "/auth/resetPassword";

}
abstract class AuthLocalConstant {
  static const String tokenKey = "token";
}
abstract class ProfileApiConstant {
}

