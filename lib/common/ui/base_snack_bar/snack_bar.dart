import 'package:flutter/material.dart';
import 'package:student_hub/common/config/navigation_event.dart';

mixin SnackBarDefault {
  void showSnackBarError(BuildContext context, String message, {SnackBarType snackBarType = SnackBarType.error}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackBarType == SnackBarType.error ? Colors.red : snackBarType == SnackBarType.success ? Colors.green : Colors.yellow,
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 36),
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showSnackBarWarning(BuildContext context, String message) {
    showSnackBarError(context, message, snackBarType: SnackBarType.warning);
  }

  void showSnackBarSuccess(BuildContext context, String message) {
    showSnackBarError(context, message, snackBarType: SnackBarType.success);
  }
}