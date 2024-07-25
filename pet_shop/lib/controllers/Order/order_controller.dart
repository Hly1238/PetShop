import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_shop/models/Home/Banners/ad_banner.dart';
import 'package:pet_shop/models/Order/order.dart';
import 'package:pet_shop/models/Order/product_order.dart';
import 'package:pet_shop/servies/Order/order_service.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  RxList<Order> orderList = List<Order>.empty(growable: true).obs;
  RxBool isOrderLoading = false.obs;
  RxString address = "".obs;
  @override
  void onInit() {
    getListOrder();
    super.onInit();
  }

  //todo [Get list Order]
  void getListOrder() async {
    try {
      // isOrderLoading(true);
      var result = await OrderService().get();
      if (result != null) {
        orderList.assignAll(orderListfromJson(result.body));
      } else {
        print("Failed to load orders: result is null");
      }
    } catch (e) {
      print("Error loading orders: $e");
      // isOrderLoading(false);
    } finally {
      print("Final orders length: ${orderList.length}");
    }
  }

  //todo [Create Order]
  Future<bool> createOrder(List<ProductOrder> selectedItems, double total,
      String address, String billing) async {
    try {
      isOrderLoading(true);
      EasyLoading.show(
        status: 'Loading',
        dismissOnTap: false,
      );

      var result =
          await OrderService().order(selectedItems, total, address, billing);
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

  Future<String> findLastestAddress() async {
    try {
      isOrderLoading(true);
      var result = await OrderService().findNewestAdrress();
      if (result.statusCode == 200) {
        var jsonResponse = jsonDecode(result.body); // Giải mã JSON
        return jsonResponse['address'];
      } else {
        return "";
      }
    } catch (e) {
      return "";
    } finally {
      // isOrderLoading(false);
    }
  }
}
