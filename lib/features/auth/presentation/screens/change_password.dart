import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/validators/app_validators.dart';
import '../../../../core/widgets/ui_utils.dart';
import '../../data/models/forget_password_request.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_cubit_states.dart';
import '../provider/auth_provider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late AuthProvider provider;

  @override
  void didChangeDependencies() {
    provider =Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    provider.resetPasswordEmailController.clear();
    provider.resetPasswordPasswordController.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.only(left: 16, right: 16, top: 90, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(ImagesAssets.routeLogo),
              Form(
                key: provider.resetPasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 46.h),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: AppValidators.emailValidator,
                      controller: provider.resetPasswordEmailController,
                    ),
                    SizedBox(height: 36.h),
                    Text(
                      'New Password',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      hintText: 'Enter your New Password',
                      isPassword: true,
                      passwordObscure: provider.resetPasswordIsObscure,
                      keyboardType: TextInputType.visiblePassword,
                      validator: AppValidators.passwordValidator,
                      controller: provider.resetPasswordPasswordController,
                      changePasswordObscure: () {
                        provider.toggleResetPasswordObscure();
                      },
                    ),
                    SizedBox(height: 56.h),
                  ],
                ),
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordLoading) {
                    UIUtils.showLoading(context,isDismissible: false);
                  } else if (state is ResetPasswordError) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(message:  state.message,bgColor:  ColorsManager.red);
                  } else if (state is ResetPasswordSuccess) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(message: 'Password Changed',bgColor:  ColorsManager.green);
                    Navigator.pop(context);
                  }
                },
                child: CustomElevatedButton(
                  text: 'Change Password',
                  onPressed: () {
                    if (provider.resetPasswordFormKey.currentState?.validate() == false)return;
                    BlocProvider.of<AuthCubit>(context).resetPassword(
                      ForgetPasswordRequest(
                        email: provider.resetPasswordEmailController.text.trim(),
                       newPassword: provider.resetPasswordPasswordController.text.trim(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
