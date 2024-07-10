import 'dart:convert';

List<Category> categoryListFromJson(String val) => List<Category>.from(
    json.decode(val)['data'].map((category) => Category.fromJson(category)));

class Category {
  final String id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> data) => Category(
        id: data['_id'],
        name: data['CategoryName'],
        image: data['image'] ??
            "https://pbs.twimg.com/profile_images/497929479063224320/LuzRK4sp_400x400.jpeg",
      );
}
