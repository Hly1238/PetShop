import 'package:flutter/material.dart';

class Product {
  final String? image, title, description;
  final int? price, size, id;
  final Color? color;

  Product(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.size,
      this.color});
}

List<Product> products = [
  Product(
      id: 1,
      title: "OC",
      price: 234,
      size: 12,
      description: "a",
      image: "a",
      color: Colors.white)
];
