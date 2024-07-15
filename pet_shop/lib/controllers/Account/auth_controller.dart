import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_shop/models/Account/user_model.dart';
import 'package:pet_shop/servies/Account/account_api_service.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<UserModel> user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
  }

  //!Register
  Future<bool> signUp({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading',
        dismissOnTap: false,
      );

      var result = await AccountApiService.signup(
          email: email, password: password, username: username, phone: phone);
      if (result.statusCode == 200) {
        EasyLoading.showSuccess("Nice");
        return true;
        // Navigator.of(context)
        //     .pushReplacementNamed(
        //         Routes.homepage);\
      } else {
        EasyLoading.showError("Try again");
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
