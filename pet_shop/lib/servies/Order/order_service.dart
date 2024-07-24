import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';
import 'package:pet_shop/models/Order/product_order.dart';

class OrderService {
  var client = http.Client();
  AuthController authController = Get.find<AuthController>();

  Future<dynamic> get() async {
    var url = Uri.http(Config.apiURL, Config.getUserOrder);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response = await client.get(Uri.parse('$url'), headers: requestHeaders);
    print(response);
    return response;
  }

  Future<dynamic> order(List<ProductOrder> selectedItems, double total,
      String address, String billing) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var url = Uri.http(Config.apiURL, Config.createOrderAPI);
    List<Map<String, dynamic>> jsonList = selectedItems.map((productOrder) {
      return {
        'product': productOrder.product.id,
        'quantity': productOrder.quantity,
        'price': productOrder.price,
      };
    }).toList();

    var body = {
      'products': jsonList,
      "orderTotal": total,
      "address": address,
      "billing": billing,
      "status": "pending",
      "description": ""
    };

    var response = await client.post(Uri.parse('$url'),
        headers: requestHeaders, body: jsonEncode(body));
    return response;
  }

  Future<dynamic> viewHistory() async {}
  Future<dynamic> changeState() async {}

  //Theo ngày tháng, giá tiền, sản phẩm
  Future<dynamic> findOrder() async {}
  Future<dynamic> findNewestAdrress() async {
    var url = Uri.http(Config.apiURL, Config.getLastestAddress);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response = await client.get(Uri.parse('$url'), headers: requestHeaders);
    return response;
  }

  Future<dynamic> reOrder() async {}
}
