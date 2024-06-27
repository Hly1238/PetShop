import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/models/Account/login_request_model.dart';

class AccountApiService {
  static var client = http.Client();
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
}
