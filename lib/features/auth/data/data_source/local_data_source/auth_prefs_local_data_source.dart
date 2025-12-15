import 'package:e_commerce/core/errors/app_exception.dart';
import 'package:e_commerce/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/resources/const_manager.dart';
@Singleton(as: AuthLocalDataSource)
class AuthPrefsLocalDataSource implements AuthLocalDataSource {

  @override
  Future<void> saveToken(String token) async{
   try {
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setString(AuthLocalConstant.tokenKey, token);
    }catch(exception){
     throw LocalException(exception: 'Failed to save token');
   }
  }

  @override
  Future<String> getToken(String token)async {
    try{
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      return sharedPrefs.getString(AuthLocalConstant.tokenKey)!;
    }catch(exception){
      throw LocalException(exception: 'Failed to get token');
    }
  }

}