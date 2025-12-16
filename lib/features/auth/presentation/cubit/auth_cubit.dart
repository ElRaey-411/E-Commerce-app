import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/Login_request.dart';
import '../../data/models/forget_password_request.dart';
import '../../data/models/register_request.dart';
import '../../domain/use_case/forget_password_use_case.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';
import '../../domain/use_case/reset_code_use_case.dart';
import '../../domain/use_case/reset_password_use_case.dart';
import 'auth_cubit_states.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registerUseCase,
    required this.loginUseCase,
    required this.forgetPasswordUseCase,
    required this.resetCodeUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitialState());
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  ForgetPasswordUseCase forgetPasswordUseCase;
  ResetCodeUseCase resetCodeUseCase;
  ResetPasswordUseCase resetPasswordUseCase;

  void register(RegisterRequest request) async {
    emit(RegisterLoading());
    final response = await registerUseCase(request);
    response.fold(
      (failure) {
        emit(RegisterError(message: failure.message));
      },
      (_) {
        emit(RegisterSuccess());
      },
    );
  }

  void login(LoginRequest request) async {
    emit(LoginLoading());
    final response = await loginUseCase(request);
    response.fold(
      (failure) {
        emit(LoginError(message: failure.message));
      },
      (_) {
        emit(LoginSuccess());
      },
    );
  }

  void forgetPassword(ForgetPasswordRequest request) async {
    emit(ForgetPasswordLoading());
    final response = await forgetPasswordUseCase(request);
    response.fold(
      (failure) {
        emit(ForgetPasswordError(message: failure.message));
      },
      (_) {
        emit(ForgetPasswordSuccess());
      },
    );
  }

  void resetCode(ForgetPasswordRequest request) async {
    emit(ResetCodeLoading());
    final response = await resetCodeUseCase(request);
    response.fold(
          (failure) {
        emit(ResetCodeError(message: failure.message));
      },
          (_) {
        emit(ResetCodeSuccess());
      },
    );
  }

  void resetPassword(ForgetPasswordRequest request) async {
    emit(ResetPasswordLoading());
    final response = await resetPasswordUseCase(request);
    response.fold(
          (failure) {
        emit(ResetPasswordError(message: failure.message));
      },
          (_) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
