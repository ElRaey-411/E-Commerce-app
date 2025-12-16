import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/core/resources/routes_manager.dart';
import 'package:e_commerce/core/widgets/ui_utils.dart';
import 'package:e_commerce/features/auth/data/models/Login_request.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/validators/app_validators.dart';
import '../provider/auth_provider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthProvider provider;

  @override
  void didChangeDependencies() {
    provider =Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    provider.loginEmailController.clear();
    provider.loginPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.only(left: 16, right: 16, top: 90, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(ImagesAssets.routeLogo),
              SizedBox(height: 86.h),
              Text(
                "Welcome Back To Route",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please sign in with your mail",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),
              Form(
                key: provider.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      controller: provider.loginEmailController,
                      hintText: 'Enter your email',
                      validator: AppValidators.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      controller: provider.loginPasswordController,
                      passwordObscure: provider.loginIsObscure,
                      hintText: 'Enter your Password',
                      isPassword: true,
                      validator: AppValidators.passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                      changePasswordObscure: () {
                        provider.toggleLoginObscure();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  text: 'Forgot password ?',
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManager.forgetPassword);
                  },
                ),
              ),
              SizedBox(height: 56.h),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    UIUtils.showLoading(context,isDismissible: false);
                  } else if (state is LoginError) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(message:  state.message,bgColor:  ColorsManager.red);
                  } else if (state is LoginSuccess) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(message:  'Login Success',bgColor:  ColorsManager.green);
                    Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
                  }
                },
                child: CustomElevatedButton(
                  text: 'Login',
                  onPressed: () {
                    if (provider.loginFormKey.currentState?.validate() == false)return;
                    BlocProvider.of<AuthCubit>(context).login(
                      LoginRequest(
                        email: provider.loginEmailController.text.trim(),
                        password: provider.loginPasswordController.text.trim(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  CustomTextButton(
                    text: 'Create Account',
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.register);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
