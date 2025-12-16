abstract class AuthState {}
class AuthInitialState extends AuthState {}
///=============================================
class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {}
class RegisterError extends AuthState {
  String message;
  RegisterError({required this.message});
}
///================================================
class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginError extends AuthState {
  String message;
  LoginError({required this.message});
}
///================================================
class ForgetPasswordLoading extends AuthState {}
class ForgetPasswordSuccess extends AuthState {}
class ForgetPasswordError extends AuthState {
  String message;
  ForgetPasswordError({required this.message});
}
///================================================
class ResetCodeLoading extends AuthState {}
class ResetCodeSuccess extends AuthState {}
class ResetCodeError extends AuthState {
  String message;
  ResetCodeError({required this.message});
}
///================================================
class ResetPasswordLoading extends AuthState {}
class ResetPasswordSuccess extends AuthState {}
class ResetPasswordError extends AuthState {
  String message;
  ResetPasswordError({required this.message});
}