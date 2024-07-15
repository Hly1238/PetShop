import 'dart:convert';

List<Cart> categoryListFromJson(String val) => List<Cart>.from(
    json.decode(val)['data'].map((category) => Cart.fromJson(category)));

class Cart {
  final String id;
  final String name;
  final String image;

  Cart({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Cart.fromJson(Map<String, dynamic> data) => Cart(
        id: data['_id'],
        name: data['CategoryName'],
        image: data['image'] ??
            "https://pbs.twimg.com/profile_images/497929479063224320/LuzRK4sp_400x400.jpeg",
      );
}
