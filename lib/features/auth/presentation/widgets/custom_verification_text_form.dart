import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomVerificationTextForm extends StatelessWidget {

  const CustomVerificationTextForm({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 6,
      textAlign: TextAlign.center,
      style:  TextStyle(fontSize: 24, letterSpacing: 16),
      decoration: InputDecoration(
        hintText: '______',
        hintStyle: TextStyle(letterSpacing: 16, color: ColorsManager.grey),
      ),

    );
  }
}
