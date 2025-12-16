import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/validators/app_validators.dart';
import '../../../../core/widgets/ui_utils.dart';
import '../../data/models/forget_password_request.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_cubit_states.dart';
import '../provider/auth_provider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  late AuthProvider provider;

  @override
  void didChangeDependencies() {
    provider =Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    provider.forgetPasswordEmailController.clear();
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
                key: provider.forgetPasswordFormKey,
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
                      controller: provider.forgetPasswordEmailController,
                      validator: AppValidators.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 56.h),
                  ],
                ),
              ),

              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ForgetPasswordLoading) {
                    UIUtils.showLoading(context,isDismissible: false);
                  } else if (state is ForgetPasswordError) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(message:  state.message,bgColor:  ColorsManager.red);
                  } else if (state is ForgetPasswordSuccess) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(message: 'Verification code sent ',bgColor:  ColorsManager.green);
                    Navigator.pushReplacementNamed(context, RoutesManager.verificationCode);
                  }
                },
                child: CustomElevatedButton(
                  text: 'Sent Verification Code',
                  onPressed: () {
                    if (provider.forgetPasswordFormKey.currentState?.validate() == false)return;
                    BlocProvider.of<AuthCubit>(context).forgetPassword(
                      ForgetPasswordRequest(
                        email: provider.forgetPasswordEmailController.text.trim(),
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
