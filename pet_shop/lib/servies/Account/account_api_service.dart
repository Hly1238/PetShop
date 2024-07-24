import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/models/Account/login_request_model.dart';

class AccountApiService {
  static var client = http.Client();

  // !Login
  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    // var url = Uri.parse(loginUrl);
    var url = Uri.http(Config.apiURL, Config.loginAPI);

    // var response = await http.post(
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    var jsonResponse = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

//
  static Future<dynamic> login2({
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

  // !Register
  // ? Kiểm tra email - dc thì mới cho tiếp
  static Future<dynamic> signup({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.apiSignUp);
    var body = {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
      "status": "actived",
    };
    var response =
        await client.post(url, headers: requestHeaders, body: jsonEncode(body));
    return response;
  }
}
