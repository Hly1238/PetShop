import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pet_shop/components/Header/header_appbar.dart';
import 'package:pet_shop/controllers/Order/order_controller.dart';
import 'package:pet_shop/models/Order/order.dart';
import 'package:intl/intl.dart';
import 'package:pet_shop/route/route_generator.dart';

class OrderScreen extends StatelessWidget {
  final List<Order> orderList;
  const OrderScreen({
    Key? key,
    this.orderList = const [],
  }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: Header_Appbar(
  //       isBack: false,
  //       isShowingCart: true,
  //       context: context,
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: ListView(
  //         children: [
  //           Obx(() {
  //             if (OrderController.instance.orderList.isEmpty) {
  //               OrderController.instance.getListOrder();
  //               return Container();
  //             } else {
  //               return Column(
  //                 children: OrderController.instance.orderList
  //                     .map((order) => OrderCard(
  //                           shopName: 'Puppy Pet Shop',
  //                           orderNumber: order.id,
  //                           orderTime: order.date,
  //                           paymentStatus: order.billing,
  //                           productDescription: "",
  //                           totalItems: order.products.length,
  //                           totalPrice: order.orderTotal,
  //                           deliveryStatus: order.status,
  //                           isDelivered: order.status == "final" ? false : true,
  //                           order: order,
  //                         ))
  //                     .toList(),
  //               );
  //               // child: ListView.builder(
  //               //   scrollDirection: Axis.horizontal,
  //               //   physics: const BouncingScrollPhysics(),
  //               //   itemCount: OrderController.instance.orderList.length,
  //               //   itemBuilder: (context, index) {
  //               //     final order = OrderController.instance.orderList[index];
  //               //     return OrderCard(
  //               //       shopName: 'Puppy Pet Shop',
  //               //       orderNumber: order.id,
  //               //       orderTime: order.date,
  //               //       paymentStatus: order.billing,
  //               //       productDescription:
  //               //           order.products[index].product.description,
  //               //       totalItems: order.products.length,
  //               //       totalPrice: order.orderTotal,
  //               //       deliveryStatus: order.status,
  //               //       isDelivered: order.status == "final" ? true : false,
  //               //     );
  //               //   },
  //               // ),
  //             }
  //           }),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header_Appbar(
        isBack: false,
        isShowingCart: true,
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (OrderController.instance.orderList.isEmpty) {
            OrderController.instance.getListOrder();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: OrderController.instance.orderList.length,
              itemBuilder: (context, index) {
                final order = OrderController.instance.orderList[index];
                return OrderCard(
                  shopName: 'Puppy Pet Shop',
                  orderNumber: order.id,
                  orderTime: order.date,
                  paymentStatus: order.billing,
                  productDescription:
                      "", // Replace with actual product description logic
                  totalItems: order.products.length,
                  totalPrice: order.orderTotal,
                  deliveryStatus: order.status,
                  isDelivered: order.status == "final" ? false : true,
                  order: order,
                );
              },
            );
          }
        }),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final String shopName;
  final String orderNumber;
  final DateTime orderTime;
  final String paymentStatus;
  final String productDescription;
  final int totalItems;
  final double totalPrice;
  final String deliveryStatus;
  final bool isDelivered;

  OrderCard({
    required this.shopName,
    required this.orderNumber,
    required this.orderTime,
    required this.paymentStatus,
    required this.productDescription,
    required this.totalItems,
    required this.totalPrice,
    required this.deliveryStatus,
    required this.isDelivered,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(orderTime);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(Routes.order_detail, arguments: order);
          print('Order ID: $orderNumber'); // In ra orderNumber khi tap vào Card

          // Future.delayed(Duration(milliseconds: 500), () {
          //   Fluttertoast.showToast(
          //     msg: 'Order ID: $orderNumber',
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.grey,
          //     textColor: Colors.white,
          //     fontSize: 16.0,
          //   );
          // });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/_project/Logo/logo.png'),
                    radius: 16,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(shopName,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text('1', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('ĐƠN HÀNG',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Text('Giỏ hàng', style: TextStyle(color: Colors.green)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(orderNumber,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Text('$formattedDate',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child:
                    Text(paymentStatus, style: TextStyle(color: Colors.orange)),
              ),
              SizedBox(height: 8),
              Text(productDescription),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$totalItems sản phẩm'),
                  Text('Tổng thanh toán: ${totalPrice.toStringAsFixed(0)}đ',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.local_shipping, color: Colors.green),
                  SizedBox(width: 8),
                  Text(deliveryStatus, style: TextStyle(color: Colors.green)),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
              SizedBox(height: 8),
              Text(
                  'Vui lòng chỉ nhấn "Đã nhận được hàng" khi đơn hàng đã được giao đến bạn và sản phẩm nhận được không có vấn đề nào.',
                  style: TextStyle(color: Colors.grey)),
              // ElevatedButton(
              //   onPressed: isDelivered ? null : () {},
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(double.infinity, 40),
              //   ),
              //   child: Text('Đã nhận được hàng'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
