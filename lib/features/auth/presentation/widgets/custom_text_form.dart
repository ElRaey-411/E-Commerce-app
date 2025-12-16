import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.changePasswordObscure,
    this.passwordObscure = true,
    this.validator,
    this.controller,
    this.keyboardType
  });

  final String hintText;
  final bool isPassword;
  final bool passwordObscure;
  final VoidCallback? changePasswordObscure;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ? passwordObscure : false,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isPassword
            ? IconButton(
          onPressed: changePasswordObscure,
          icon: Icon(
            passwordObscure
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        )
            : null,
      ),
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
    );
  }
}
