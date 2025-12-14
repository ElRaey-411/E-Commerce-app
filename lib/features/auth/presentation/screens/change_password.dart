import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: REdgeInsets.only(left: 16,right: 16,top:50,bottom: 16 ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(ImagesAssets.routeLogo),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  SizedBox(height: 46.h),
                  Text('New Password',style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 24.h),
                  CustomTextForm(hintText: 'Enter your New Password',isPassword: true),
                  SizedBox(height: 36.h),
                  Text('Confirm Password',style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 24.h),
                  CustomTextForm(hintText: 'Confirm your New Password',isPassword: true),
                  SizedBox(height: 56.h),
                ],
              ),
              CustomElevatedButton(text: 'Reset Password', onPressed: (){}),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
