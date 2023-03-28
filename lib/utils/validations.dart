import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/strings.dart';

class ValidationUtils {
  static bool isValidEmail(String email) {
    return RegExp(ReusableString.emailIdRegex.trim()).hasMatch(email);
  }

  static bool isPasswordMatched(String password) {
    return RegExp(ReusableString.passwordMatchRegex.trim()).hasMatch(password);
  }

  static bool isValidMobileNumber(String mobileNumber) {
    return RegExp(ReusableString.mobileNumberRegex.trim())
        .hasMatch(mobileNumber);
  }

  static bool isValidPassword(String password) {
    if (password.length > 7) {
      return true;
    }
    return false;
  }

  static bool isValidName(String name) {
    return RegExp(ReusableString.nameRegex.trim()).hasMatch(name);
  }

  static bool isFieldEmpty(String text) {
    return text.trim().isNotEmpty;
  }

  static showSnackBar(String message) {
    // SnackBar snackBar = SnackBar(content: Text(message));
    // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Get.snackbar(message, "dismiss");
  }

  static showLoaderDialog({String? message}) {
    Widget alert = WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(message ?? ReusableString.pleaseWait)),
            ],
          ),
        ));
    Get.dialog(barrierDismissible: false, alert);
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (BuildContext context) {
    //     return alert;
    //   },
    // );
  }

  static hideDialog({required BuildContext context}) => Navigator.pop(context);

  static showCheckoutDialog({required BuildContext context, String? message}) {
    Widget alert = WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Row(
            children: [
              TextButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                child: const Text("cancel"),
              ),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(message ?? ReusableString.pleaseWait)),
            ],
          ),
        ));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
