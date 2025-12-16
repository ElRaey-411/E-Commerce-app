import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/validators/app_validators.dart';
import '../../../../core/widgets/ui_utils.dart';
import '../../data/models/register_request.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_cubit_states.dart';
import '../provider/auth_provider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late AuthProvider provider;

  @override
  void didChangeDependencies() {
    provider =Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    provider.registerNameController.clear();
    provider.registerPhoneController.clear();
    provider.registerEmailController.clear();
    provider.registerPasswordController.clear();
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
              SizedBox(height: 46.h),
              Form(
                key: provider.registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      hintText: 'Enter your full name',
                      validator: AppValidators.nameValidator,
                      controller: provider.registerNameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'Phone Number',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      hintText: 'Enter your phone number',
                      validator: AppValidators.phoneValidator,
                      controller: provider.registerPhoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      hintText: 'Enter your email',
                      validator: AppValidators.emailValidator,
                      controller: provider.registerEmailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextForm(
                      passwordObscure: provider.registerIsObscure,
                      controller: provider.registerPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Enter your Password',
                      isPassword: true,
                      validator: AppValidators.passwordValidator,
                      changePasswordObscure: () {
                        provider.toggleRegisterObscure();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 56.h),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterLoading) {
                    UIUtils.showLoading(context, isDismissible: false);
                  } else if (state is RegisterError) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(
                      message: state.message,
                      bgColor: ColorsManager.red,
                    );
                  } else if (state is RegisterSuccess) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(
                      message: 'Register Success',
                      bgColor: ColorsManager.green,
                    );
                    Navigator.pop(context);
                  }
                },
                child: CustomElevatedButton(
                  text: 'sign up',
                  onPressed: () {
                    if (provider.registerFormKey.currentState?.validate() == false) return;
                    BlocProvider.of<AuthCubit>(context).register(
                      RegisterRequest(
                        name: provider.registerNameController.text.trim(),
                        phone: provider.registerPhoneController.text.trim(),
                        email: provider.registerEmailController.text.trim(),
                        password: provider.registerPasswordController.text.trim(),
                        rePassword: provider.registerPasswordController.text.trim(),
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
                    'Already have an account? ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  CustomTextButton(
                    text: 'sign in',
                    onTap: () {
                      Navigator.pop(context);
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
