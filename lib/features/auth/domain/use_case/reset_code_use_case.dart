import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/forget_password_request.dart';
import '../repo/auth_repo.dart';
@lazySingleton
class ResetCodeUseCase {
  AuthRepo authRepo;
  ResetCodeUseCase({required this.authRepo});
  Future<Either<Failure, void>> call(ForgetPasswordRequest request) {
    return authRepo.verifyCode(request);
  }
}