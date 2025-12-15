import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/Login_request.dart';
import '../../data/models/register_request.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';
import 'auth_cubit_states.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase, required this.loginUseCase})
      : super(AuthInitialState());
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;

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
    response.fold((failure){
      emit(LoginError(message: failure.message));
    }, (_){
      emit(LoginSuccess());
    });
  }
}
