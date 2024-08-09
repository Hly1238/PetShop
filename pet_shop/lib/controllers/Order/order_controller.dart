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
  RxList<Order> ordersSuccess = List<Order>.empty(growable: true).obs;
  RxList<Order> orderCancel = List<Order>.empty(growable: true).obs;
  RxList<Order> orderApproved = List<Order>.empty(growable: true).obs;
  RxList<Order> orderPending = List<Order>.empty(growable: true).obs;
  RxList<ProductUnreviewed> unreviewdList =
      List<ProductUnreviewed>.empty(growable: true).obs;
  RxBool isOrderLoading = false.obs;
  RxString address = "".obs;
  Rxn<Order> order = Rxn<Order>();

  @override
  void onInit() {
    getListOrder();
    getListOrderStaus("pending");
    getListOrderStaus("approved");
    getListOrderStaus("rejected");
    getListOrderStaus("final");
    getUnreviewedList();
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
    } finally {
      // isOrderLoading(false);
      print("Final orders length: ${orderList.length}");
    }
  }

  Future<bool> getAllStatusOrder() async {
    try {
      await Future.wait([
        getListOrderStaus("pending"),
        getListOrderStaus("approved"),
        getListOrderStaus("rejected"),
        getListOrderStaus("final"),
        getUnreviewedList()
      ]);
      return true;
    } catch (e) {
      print("Error getting all status orders: $e");
      return false;
    }
  }

  //todo [Get list Unrevied]
  Future<void> getUnreviewedList() async {
    try {
      var result = await OrderService().getUnreviewedItem();
      if (result != null) {
        List<dynamic> data = jsonDecode(result.body);

        List<ProductUnreviewed> productList = [];
        for (var order in data) {
          String orderId = order['orderId'];
          for (var item in order['products']) {
            if (!item['isReview']) {
              productList.add(ProductUnreviewed.fromJson({
                'orderId': orderId,
                'product': item['product'],
              }));
            }
          }
        }

        unreviewdList.assignAll(productList);
        print("Loaded ${unreviewdList.length} unreviewed products");
      } else {
        print("Failed to load orders: result is null");
      }
    } catch (e) {
      print("Error loading orders: $e");
    } finally {
      for (var i = 0; i < unreviewdList.length; i++) {
        print("aaaaaaaaaaaaaaaa ${unreviewdList[i]}");
      }
      print("Final products length: ${unreviewdList.length}");
    }
  }

  //todo [Get list Order Status]
  Future<void> getListOrderStaus(String status) async {
    try {
      var result = await OrderService().getOrderByStatus(status);
      if (result != null) {
        if (status == "pending") {
          orderPending.assignAll(orderListfromJson(result.body));
        } else if (status == "approved") {
          orderApproved.assignAll(orderListfromJson(result.body));
        } else if (status == "rejected") {
          orderCancel.assignAll(orderListfromJson(result.body));
        } else {
          ordersSuccess.assignAll(orderListfromJson(result.body));
        }
      } else {
        print("Failed to load orders: result is null");
      }
    } catch (e) {
      print("Error loading orders: $e");
    } finally {
      print("Final orders length: ${orderList.length}");
    }
  }

  //todo [Update Is Confirm]
  Future<bool> updateIsConfirm(String id) async {
    try {
      var result = await OrderService().updateIsConfirm(id);
      if (result != null) {
        EasyLoading.showSuccess(
            "Cảm ơn bạn đã mua hàng! Chúng tôi rất mong được sự góp ý của bạn!");
        return true;
      } else {
        EasyLoading.showError(
            "Hệ thống đã xảy ra lỗi, xin vui lòng thử lại sau");
        return false;
      }
    } catch (e) {
      EasyLoading.showError("Hệ thống đã xảy ra lỗi, xin vui lòng thử lại sau");
      print("Error loading orders: $e");
      return false;
    } finally {
      print("Final orders length: ${orderList.length}");
    }
  }

  //todo [Create Order]
  Future<bool> createOrder(List<ProductOrder> selectedItems, int total,
      String address, String billing, String status, String description) async {
    try {
      isOrderLoading(true);
      EasyLoading.show(
        status: 'Loading',
        dismissOnTap: false,
      );

      var result = await OrderService()
          .order(selectedItems, total, address, billing, status, description);
      if (result.statusCode == 200) {
        var data = json.decode(result.body);
        Order createdOrder = Order.fromJson(data);
        order.value = createdOrder;
        EasyLoading.showSuccess("Đặt hàng thành công");
        return true;
      } else {
        EasyLoading.showError(
            "Rất tiếc! Hệ thống đã xảy ra lỗi vui lòng thử lại sau!");
        return false;
      }
    } catch (e) {
      EasyLoading.showError(
          "Rất tiếc! Hệ thống đã xảy ra lỗi vui lòng thử lại sau!");
      return false;
    } finally {
      getListOrder();
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

  //todo [Post Comment]
  Future<bool> commentProduct(
      String comment, double rating, String id_order, String idProduct) async {
    try {
      isOrderLoading(true);
      EasyLoading.show(
        status: 'Loading',
        dismissOnTap: false,
      );

      var result = await OrderService()
          .commentProduct(comment, rating, id_order, idProduct);
      if (result.statusCode == 201) {
        EasyLoading.showSuccess("Cảm ơn bạn!");
        return true;
      } else {
        EasyLoading.showError("Bạn đã đánh giá sản phẩm này");
        return false;
      }
    } catch (e) {
      EasyLoading.showError("Hệ thống đang xảy ra sự cố vui lòng thử lại sau!");

      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
