import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/forget_password_request.dart';
import '../repo/auth_repo.dart';
@lazySingleton
class ForgetPasswordUseCase {
  AuthRepo authRepo;
  ForgetPasswordUseCase({required this.authRepo});
  Future<Either<Failure, void>> call(ForgetPasswordRequest request) {
    return authRepo.forgetPassword(request);
  }
}
