import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';

class CartService {
  var client = http.Client();
  AuthController authController = Get.find<AuthController>();

  Future<dynamic> getAll() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var url = Uri.http(Config.apiURL, Config.cartAPI);
    var response =
        await client.get(Uri.parse('${url}'), headers: requestHeaders);

    return response;
  }

  Future<dynamic> addToCart(
      String productId, int quantity, double? price) async {
    var url = Uri.http(Config.apiURL, Config.cartAPI);
    var body = {
      "productId": productId,
      "quantity": quantity,
      "price": price ?? 0
    };
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response = await client.post(Uri.parse('${url}'),
        headers: requestHeaders, body: jsonEncode(body));

    return response;
  }

  Future<dynamic> substractItem(String productId) async {
    var url = Uri.http(Config.apiURL, Config.subtractCartAPI);
    var body = {
      "productId": productId,
    };
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response = await client.post(Uri.parse('${url}'),
        headers: requestHeaders, body: jsonEncode(body));

    return response;
  }

  Future<dynamic> removeItem(String productId) async {
    var url = Uri.http(Config.apiURL, Config.cartAPI);
    var body = {
      "productId": productId,
    };
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response = await client.delete(Uri.parse('${url}'),
        headers: requestHeaders, body: jsonEncode(body));

    return response;
  }
}
