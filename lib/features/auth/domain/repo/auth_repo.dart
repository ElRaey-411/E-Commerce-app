import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/Login_request.dart';
import '../../data/models/register_request.dart';
import '../entities/user_entity.dart';
abstract class AuthRepo {
Future<Either<Failure, UserEntity>> register(RegisterRequest request);
Future<Either<Failure, UserEntity>> login(LoginRequest request);
}