import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../resources/colors_manager.dart';
class UIUtils {
  static void showLoading(BuildContext context, {bool isDismissible = true}) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) => PopScope(
        canPop: isDismissible,
        child: CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: ColorsManager.blue),
            ],
          ),
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(
          message,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  static void toastMessage({
    required String message,
    required Color bgColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor,
      textColor: ColorsManager.white,
      fontSize: 16,
    );
  }
}
