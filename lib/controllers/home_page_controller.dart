import 'package:get/get.dart';
import 'package:getxlogin/services/api_manager.dart';
import 'package:getxlogin/services/user_service.dart';

import '../models/userdata_model.dart';
import '../utils/validations.dart';

class HomePageController extends GetxController {
  UserDataModel? userdata;
  var dataisLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getActiveUser();
    super.onInit();
  }

  getActiveUser() {
    APIService.getUserData().then((APIResponse response) async {
      if (response.success == true) {
        print(response.data);
        userdata = userDataModelFromJson(response.data);
      } else {
        ValidationUtils.showSnackBar(response.message.toString());
      }
    });
  }
}
