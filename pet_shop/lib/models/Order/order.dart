import 'dart:convert';

import 'package:pet_shop/models/Account/user_model.dart';
import 'package:pet_shop/models/Order/product_order.dart';

List<Order> orderListfromJson(String val) {
  final data = jsonDecode(val);
  final docs = data['data'] as List<dynamic>;
  return List<Order>.from(docs.map((order) => Order.fromJson(order)));
}

class Order {
  final String id;
  final String user;
  final List<ProductOrder> products;
  final double orderTotal;
  final String address;
  final String billing;
  final String status;
  final String description;
  final DateTime date;

  factory Order.fromJson(Map<String, dynamic> data) {
    return Order(
      id: data['_id'],
      // user: UserModel.fromJson(data['user']),
      user: data['user'],
      products: List<ProductOrder>.from(
          data['products'].map((item) => ProductOrder.fromJson(item))),
      orderTotal: data['orderTotal'].toDouble(),
      address: data['address'],
      billing: data['billing'],
      status: data['status'],
      description: data['description'],
      date: DateTime.parse(data['date']),
    );
  }

  Order({
    required this.id,
    required this.user,
    required this.products,
    required this.orderTotal,
    required this.address,
    required this.billing,
    required this.status,
    required this.description,
    required this.date,
  });
  @override
  String toString() {
    return 'Order{id: $id, user: ${user.toString()}, products: ${products.map((p) => p.toString()).join(', ')}, orderTotal: $orderTotal, address: $address, billing: $billing, status: $status, description: $description, date: $date}';
  }
}
