import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/config/secure_storage/security_storage.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';
import 'package:pet_shop/models/Order/product_order.dart';

class OrderService {
  var client = http.Client();
  AuthController authController = Get.find<AuthController>();
  Map<String, String> requestHeaders = {};

  Future<void> init() async {
    String token = await SecurityStorage().getSecureData("token");
    requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${token}',
    };
  }

  Future<dynamic> get() async {
    var url = Uri.http(Config.apiURL, Config.getUserOrder);
    await init();

    var response = await client.get(Uri.parse('$url'), headers: requestHeaders);
    return response;
  }

  // todo [Get List Order Status]
  Future<dynamic> getOrderByStatus(String status) async {
    var url =
        Uri.http(Config.apiURL, Config.getOrderStauts, {'status': status});
    await init();
    var response = await client.get(Uri.parse('$url'), headers: requestHeaders);
    return response;
  }

  // todo [Update is confirm]
  Future<dynamic> updateIsConfirm(String id) async {
    var url = Uri.http(Config.apiURL, Config.updateIsConfirm, {'id': id});
    await init();
    var response = await client.get(Uri.parse('$url'), headers: requestHeaders);
    return response;
  }

  // todo [Get Unreviewd Item]
  Future<dynamic> getUnreviewedItem() async {
    var url = Uri.http(Config.apiURL, Config.getUnreviewdItem);
    await init();
    var response = await client.get(Uri.parse('$url'), headers: requestHeaders);
    return response;
  }

  Future<dynamic> order(List<ProductOrder> selectedItems, int total,
      String address, String billing, String status, String description) async {
    await init();

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
      "status": status ?? "pending",
      "description": description ?? ""
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
    await init();

    var response = await client.get(Uri.parse('$url'), headers: requestHeaders);
    return response;
  }

  Future<dynamic> reOrder() async {}

  //todo [Post Reviews]
  Future<dynamic> commentProduct(
      String comment, double rating, String id_order, String idProduct) async {
    await init();
    var url = Uri.http(
        Config.apiURL, "${Config.productPostReviews}/$idProduct/reviews");

    var body = {
      'comment': comment,
      "rating": rating,
      "id_order": id_order,
    };

    var response = await client.post(Uri.parse('$url'),
        headers: requestHeaders, body: jsonEncode(body));
    return response;
  }
}
