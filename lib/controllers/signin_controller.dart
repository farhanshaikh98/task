import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlogin/view/home_page.dart';

import '../services/api_manager.dart';
import '../services/user_service.dart';
import '../utils/validations.dart';

class SignInController extends GetxController {
  var btnActivationStatus = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginHandle() async {
    ValidationUtils.showLoaderDialog();
    APIService.login(usernameController.text, passwordController.text)
        .then((APIResponse response) {
      if (response.success == true) {
        Get.back();
        print(response.data);
        Get.to(() => HomePage());
        usernameController.clear();
        passwordController.clear();
      } else {
        Get.back();
        Get.snackbar(
          'user name or password is incorrect',
          "dismiss",
          snackPosition: SnackPosition.BOTTOM,
        );
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: const Text('user name or password is incorrect'),
        //   action: SnackBarAction(
        //     label: 'dismiss',
        //     onPressed: () {},
        //   ),
        // ));
      }
    });
  }

  validateFieldsEnter() {
    if (ValidationUtils.isFieldEmpty(usernameController.text) &&
        ValidationUtils.isFieldEmpty(passwordController.text)) {
      btnActivationStatus(true);
    } else {
      btnActivationStatus(false);
    }
  }
}
