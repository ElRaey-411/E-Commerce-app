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
import '../widgets/custom_verification_text_form.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  late AuthProvider provider;

  @override
  void didChangeDependencies() {
    provider =Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    provider.resetCodeController.clear();
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
                key: provider.resetCodeFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 46.h),
                    Text(
                      'Enter Verification Code',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 24.h),
                    CustomVerificationTextForm(
                      controller: provider.resetCodeController,
                      validator: AppValidators.resetCodeValidator,
                    ),
                    SizedBox(height: 56.h),
                  ],
                ),
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetCodeLoading) {
                    UIUtils.showLoading(context, isDismissible: false);
                  } else if (state is ResetCodeError) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(
                      message: state.message,
                      bgColor: ColorsManager.red,
                    );
                  } else if (state is ResetCodeSuccess) {
                    UIUtils.hideDialog(context);
                    UIUtils.toastMessage(
                      message: 'Code Verified ',
                      bgColor: ColorsManager.green,
                    );
                    Navigator.pushReplacementNamed(context, RoutesManager.changePassword);
                  }
                },
                child: CustomElevatedButton(
                  text: 'Verify Code',
                  onPressed: () {
                    if (provider.resetCodeFormKey.currentState?.validate() == false) return;
                    BlocProvider.of<AuthCubit>(context).resetCode(
                      ForgetPasswordRequest(
                        resetCode: provider.resetCodeController.text.trim(),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
