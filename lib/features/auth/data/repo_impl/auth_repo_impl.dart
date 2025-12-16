import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/app_exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:e_commerce/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/models/Login_request.dart';
import 'package:e_commerce/features/auth/data/models/forget_password_request.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repo/auth_repo.dart';
@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepoImpl({required this.authRemoteDataSource,required this.authLocalDataSource});

  @override
  Future<Either<Failure, UserEntity>> register(RegisterRequest request) async{
    try{
      final response = await authRemoteDataSource.register(request);
      authLocalDataSource.saveToken(response.token);
      return Right(response.user.toUserEntity());
    }on AppException catch (exception){
      return Left(Failure(message: exception.exception));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest request)async {
    try{
      final response = await authRemoteDataSource.login(request);
      authLocalDataSource.saveToken(response.token);
      return Right(response.user.toUserEntity());
    }on AppException catch (exception){
      return Left(Failure(message: exception.exception));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(ForgetPasswordRequest request)async {
    try{
      await authRemoteDataSource.forgetPassword(request);
      return Right(null);
    }on AppException catch (exception){
      return Left(Failure(message: exception.exception));
    }
  }

  @override
  Future<Either<Failure, void>> verifyCode(ForgetPasswordRequest request) async{
    try{
      await authRemoteDataSource.verifyCode(request);
      return Right(null);
    }on AppException catch (exception){
      return Left(Failure(message: exception.exception));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(ForgetPasswordRequest request) async{
    try{
      await authRemoteDataSource.resetPassword(request);
      return Right(null);
    }on AppException catch (exception){
      return Left(Failure(message: exception.exception));
    }
  }


}