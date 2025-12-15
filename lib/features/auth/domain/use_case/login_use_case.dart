import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/Login_request.dart';
import '../entities/user_entity.dart';
import '../repo/auth_repo.dart';
@singleton
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase({required this.authRepo});

  Future<Either<Failure, UserEntity>> call(LoginRequest request) {
    return authRepo.login(request);
  }
}
