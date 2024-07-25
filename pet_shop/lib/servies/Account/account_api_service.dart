import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';

class AccountApiService {
  static var client = http.Client();

  //!Login
  static Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.loginAPI);
    var body = {
      "email": email,
      "password": password,
    };
    var response =
        await client.post(url, headers: requestHeaders, body: jsonEncode(body));

    return response;
  }

  //!Check exists token

  // !Register
  // ? Kiểm tra email - dc thì mới cho tiếp
  static Future<dynamic> signup(
      {required String email,
      required String password,
      required String phone}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.apiSignUp);
    var body = {"email": email, "password": password, "phone": phone};
    var response =
        await client.post(url, headers: requestHeaders, body: jsonEncode(body));
    return response;
  }

  //! Get OTP update password
  static Future<dynamic> getOTP({
    required String email,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.getOtpAPI);
    var body = {
      "email": email.trim(),
    };
    var response =
        await client.post(url, headers: requestHeaders, body: jsonEncode(body));
    return response;
  }

  // ! Verify OTP password
  static Future<dynamic> verifyOTP({
    required String email,
    required String otp,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.verifyOtpAPI);
    var body = {
      "email": email.trim(),
      "otp": otp.trim(),
    };
    var response =
        await client.post(url, headers: requestHeaders, body: jsonEncode(body));
    return response;
  }

  //! Change Forget Password
  static Future<dynamic> updatePassOtp({
    required String email,
    required String password,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.updatePassOtpAPI);
    var body = {
      "email": email.trim(),
      "password": password.trim(),
    };
    var response =
        await client.post(url, headers: requestHeaders, body: jsonEncode(body));
    return response;
  }

  //! Activate Account
  static Future<dynamic> activateAcc({
    required String activatecode,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, "${Config.activateAPI}$activatecode");

    var response = await client.get(url, headers: requestHeaders);
    return response;
  }
}
