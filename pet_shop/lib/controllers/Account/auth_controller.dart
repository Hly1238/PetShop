import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_shop/models/Account/user_model.dart';
import 'package:pet_shop/servies/Account/account_api_service.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<UserInfo> user = Rxn<UserInfo>();
  RxBool isLogin = false.obs;

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

  String? get token => user.value?.token;

  void setUser(UserInfo? newUser) {
    user.value = newUser;
  }

  void clear() {
    user.value = null;
  }

  //!Login
  //!Login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading',
        dismissOnTap: false,
      );

      var result =
          await AccountApiService.login2(email: email, password: password);
      print(result.body);

      if (result.statusCode == 200) {
        EasyLoading.showSuccess("Nice");
        isLogin(true);

        var data = json.decode(result.body);
        var userData = data['user'];
        var token = data['token'] ?? '';

        user.value = UserInfo.fromJson({...userData, 'token': token});
        print("Created UserModel: ${user.value}"); // Debug created UserModel

        return true;
      } else {
        EasyLoading.showError("Try again");
        isLogin(false);
        return false;
      }
    } catch (e) {
      print("Error: $e"); // Print any errors that occur
      isLogin(false);
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
