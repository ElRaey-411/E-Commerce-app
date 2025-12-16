class AppValidators {
  static String? nameValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "The name is required";
    }
    if (input.contains(RegExp(r'\s{2,}'))) {
      return "Name should not contain consecutive spaces";
    }
    if (input.trim().length < 3) {
      return "Name must be at least 3 characters";
    }
    if (input.trim().length > 20) {
      return "Name should not exceed 20 characters";
    }
    return null;
  }


  static String? emailValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "The email is required";
    }
    if (input.contains(' ')) {
      return "Email should not contain spaces";
    }
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(input.trim())) {
      return "Enter valid email";
    }
    return null;
  }



  static String? passwordValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "The password is required";
    }
    if (input.contains(' ')) {
      return "Password should not contain spaces";
    }
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#&*~]).{8,}$',
    );
    if (!passwordRegex.hasMatch(input)) {
      return "Password must have at least 8 characters, including upper, lower, number & special character";
    }
    return null;
  }


  static String? phoneValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "The phone is required";
    }
    if (input.contains(' ')) {
      return "Phone number should not contain spaces";
    }
    final RegExp phoneRegex = RegExp(r'^0\d{10}$');
    if (!phoneRegex.hasMatch(input)) {
      return "Enter valid phone number";
    }
    return null;
  }


  static String? resetCodeValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "The Verification code is required";
    }

    final code = input.trim();

    if (code.contains(' ')) {
      return "Verification code should not contain spaces";
    }

    if (code.length < 5 || code.length > 6) {
      return "Enter valid 5 or 6-digit Verification code";
    }

    if (!RegExp(r'^\d{5,6}$').hasMatch(code)) {
      return "Verification code must contain only numbers";
    }

    return null;
  }

}
