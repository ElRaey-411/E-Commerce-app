import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController forgetPasswordEmailController = TextEditingController();
  TextEditingController resetCodeController = TextEditingController();
  TextEditingController resetPasswordPasswordController = TextEditingController();
  TextEditingController resetPasswordEmailController = TextEditingController();

  bool registerIsObscure = true;
  bool loginIsObscure = true;
  bool resetPasswordIsObscure = true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetCodeFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();




  void toggleRegisterObscure() {
    registerIsObscure = !registerIsObscure;
    notifyListeners();
  }

  void toggleLoginObscure() {
    loginIsObscure = !loginIsObscure;
    notifyListeners();
  }
  void toggleResetPasswordObscure() {
    resetPasswordIsObscure = !resetPasswordIsObscure;
    notifyListeners();
  }
}