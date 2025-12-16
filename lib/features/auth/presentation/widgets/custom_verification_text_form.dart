import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomVerificationTextForm extends StatelessWidget {

  const CustomVerificationTextForm({
    super.key,
    this.validator,
    this.controller,
  });

  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,
      keyboardType: TextInputType.number,
      maxLength: 6,
      buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      style:  TextStyle(fontSize: 24, letterSpacing: 16),
      decoration: InputDecoration(
        hintText: '______',
        hintStyle: TextStyle(letterSpacing: 16, color: ColorsManager.grey),
      ),

    );
  }
}
