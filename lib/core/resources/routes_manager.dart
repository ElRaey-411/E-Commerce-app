

import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/change_password.dart';
import '../../features/auth/presentation/screens/forget_password.dart';
import '../../features/auth/presentation/screens/login.dart';
import '../../features/auth/presentation/screens/register.dart';
import '../../features/auth/presentation/screens/verification_code.dart';
import '../../features/main_layout/main_layout.dart';
import '../../features/onboarding/onboarding.dart';
import '../../features/splash/splash.dart';

class RoutesManager {
  static const String login = "login";
  static const String register = "register";
  static const String forgetPassword = "forgetPassword";
  static const String verificationCode = "verificationCode";
  static const String changePassword = "changePassword";
  static const String mainLayout = "mainLayout";
  static const String onBoarding = "onBoarding";
  static const String splash= "splash";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => Splash());
        case onBoarding:
        return MaterialPageRoute(builder: (_) => Onboarding());
      case login:
    return MaterialPageRoute(builder: (_) => Login());
      case register:
        return MaterialPageRoute(builder: (_) => Register());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case mainLayout:
        return MaterialPageRoute(
          builder: (context) => MainLayout(),
        );
        case verificationCode:
        return MaterialPageRoute(
          builder: (context) => VerificationCode(),
        );
        case changePassword:
        return MaterialPageRoute(
          builder: (context) => ChangePassword(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
