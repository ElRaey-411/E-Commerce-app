import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/register_request.dart';
import '../entities/user_entity.dart';
import '../repo/auth_repo.dart';
@singleton
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase({required this.authRepo});

  Future<Either<Failure, UserEntity>> call(RegisterRequest request) {
    return authRepo.register(request);
  }
}
