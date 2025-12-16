// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/local_data_source/auth_local_data_source.dart'
    as _i672;
import '../../features/auth/data/data_source/local_data_source/auth_prefs_local_data_source.dart'
    as _i213;
import '../../features/auth/data/data_source/remote_data_source/auth_api_remote_data_source.dart'
    as _i272;
import '../../features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i885;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use_case/forget_password_use_case.dart'
    as _i90;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/register_use_case.dart' as _i463;
import '../../features/auth/domain/use_case/reset_code_use_case.dart' as _i229;
import '../../features/auth/domain/use_case/reset_password_use_case.dart'
    as _i149;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i885.AuthRemoteDataSource>(
      () => _i272.AuthApiRemoteDataSource(),
    );
    gh.singleton<_i672.AuthLocalDataSource>(
      () => _i213.AuthPrefsLocalDataSource(),
    );
    gh.singleton<_i170.AuthRepo>(
      () => _i279.AuthRepoImpl(
        authRemoteDataSource: gh<_i885.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i672.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i973.LoginUseCase>(
      () => _i973.LoginUseCase(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.singleton<_i463.RegisterUseCase>(
      () => _i463.RegisterUseCase(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i90.ForgetPasswordUseCase>(
      () => _i90.ForgetPasswordUseCase(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i229.ResetCodeUseCase>(
      () => _i229.ResetCodeUseCase(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i149.ResetPasswordUseCase>(
      () => _i149.ResetPasswordUseCase(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.singleton<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        registerUseCase: gh<_i463.RegisterUseCase>(),
        loginUseCase: gh<_i973.LoginUseCase>(),
        forgetPasswordUseCase: gh<_i90.ForgetPasswordUseCase>(),
        resetCodeUseCase: gh<_i229.ResetCodeUseCase>(),
        resetPasswordUseCase: gh<_i149.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}
