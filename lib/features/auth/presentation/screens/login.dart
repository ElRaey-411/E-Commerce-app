import 'package:e_commerce/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.only(left: 16,right: 16,top:90,bottom: 16 ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(ImagesAssets.routeLogo),
              SizedBox(height:86.h),
              Text(
                "Welcome Back To Route",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 8.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please sign in with your mail",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text('Email',style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 24.h),
                  CustomTextForm(hintText: 'Enter your email'),
                  SizedBox(height: 32.h),
                  Text('Password',style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 24.h),
                  CustomTextForm(hintText: 'Enter your Password',isPassword: true)
                ],
              ),
              SizedBox(height: 16.h),
              Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(text: 'Forgot password ?', onTap:(){
                    Navigator.pushNamed(context, RoutesManager.forgetPassword);
                  } )),
              SizedBox(height: 56.h),
              CustomElevatedButton(text: 'Login', onPressed: (){
                Navigator.pushNamed(context, RoutesManager.mainLayout);
              }),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account? ',style: Theme.of(context).textTheme.displayMedium),
                  CustomTextButton(text: 'Create Account', onTap: (){
                    Navigator.pushNamed(context, RoutesManager.register);
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
