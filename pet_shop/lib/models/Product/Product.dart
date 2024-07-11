import 'dart:convert';
import 'package:pet_shop/models/Product/category.dart';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((product) => Product.fromJson(product)));

class Product {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final double price;
  final double stockPrice;
  final double discount;
  final Map<String, double> type;
  final Category category;
  final int stockQuantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.stockPrice,
    required this.discount,
    required this.type,
    required this.category,
    required this.stockQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    List<String> parsedImages = data["Images"] != null
        ? List<String>.from(data["Images"])
        : [
            "https://pbs.twimg.com/profile_images/497929479063224320/LuzRK4sp_400x400.jpeg",
            "https://picsum.photos/250?image=9"
          ];

    Map<String, double> parsedType = data["Types"] != null
        ? Map<String, double>.from(data["Types"])
        : {
            "màu vàng": 30.0,
            "màu cam": 304.0,
          };

    return Product(
      id: data["_id"],
      name: data["ProductName"],
      description: data["Description"],
      images: parsedImages,
      price: data["Price"]
          .toDouble(), // Ensure price is converted to double if needed
      stockPrice:
          data["StockPrice"] != null ? data["StockPrice"].toDouble() : 10234.0,
      discount: data["Discount"] != null ? data["Discount"].toDouble() : 0.3,
      type: parsedType,
      category: Category.fromJson(data["CategoryID"]),
      stockQuantity: data["StockQuantity"],
    );
  }
  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, images: $images, price: $price, stockPrice: $stockPrice, discount: $discount, type: $type, category: $category, stockQuantity: $stockQuantity}';
  }
}
