import 'dart:convert';

import 'package:pet_shop/models/Product/product.dart';

class ProductOrder {
  final String id;
  final Product product;
  final int quantity;
  final double price;

  factory ProductOrder.fromJson(Map<String, dynamic> data) => ProductOrder(
        id: data['_id'],
        product: Product.fromJson(data['product']),
        quantity: data['quantity'],
        price: data['price'].toDouble(),
      );

  ProductOrder(
      {required this.id,
      required this.product,
      required this.quantity,
      required this.price});
}

List<ProductOrder> productOrderListFromJson(String val) {
  final data = json.decode(val);
  return List<ProductOrder>.from(
      data['products'].map((details) => ProductOrder.fromJson(details)));
}
