import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form.dart';


class Register extends StatelessWidget {
  const Register({super.key});

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
              SizedBox(height: 46.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text('Full Name',style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 24.h),
                  CustomTextForm(hintText: 'Enter your full name'),
                  SizedBox(height: 32.h),
                  Text('Phone Number',style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 24.h),
                  CustomTextForm(hintText: 'Enter your phone number'),
                  SizedBox(height: 32.h),
                  Text('Email',style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 24.h),
                  CustomTextForm(hintText: 'Enter your email'),
                  SizedBox(height: 32.h),
                  Text('Password',style: Theme.of(context).textTheme.displayMedium),
                ],
              ),
              SizedBox(height: 56.h),
              CustomElevatedButton(text: 'sign up', onPressed: (){
              }),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',style: Theme.of(context).textTheme.displayMedium),
                  CustomTextButton(text: 'sign in', onTap: (){
                    Navigator.pop(context);
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
