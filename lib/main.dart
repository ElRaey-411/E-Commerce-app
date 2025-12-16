import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/theme_manager.dart';
import 'core/di/get_it.dart';
import 'core/resources/routes_manager.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/provider/auth_provider.dart';

void main() {
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      BlocProvider(create: (context) => getIt<AuthCubit>()),
    ],
      child: ECommerce()));
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.generateRoute,
        initialRoute: RoutesManager.login,
        theme: ThemeManager.light,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
