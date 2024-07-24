import 'dart:convert';
import 'package:hive/hive.dart';
// part 'ad_banner.g.dart';

// List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
//     json.decode(val)['data'].map((banner) => AdBanner.fromJson(banner)));

// @HiveType(typeId: 1)
// class AdBanner {
//   @HiveType(typeId: 0)
//   final String id;
//   @HiveType(typeId: 1)
//   final String image;

//   AdBanner({
//     required this.id,
//     required this.image,
//   });

//   factory AdBanner.fromJson(Map<String, dynamic> data) =>
//       AdBanner(id: data['_id'], image: data['BannerImage']);
// }

List<AdBanner> adBannerListFromJson(String val) {
  final data = jsonDecode(val);
  final docs = data['data']['docs'] as List<dynamic>;
  return List<AdBanner>.from(docs.map((product) => AdBanner.fromJson(product)));
}

@HiveType(typeId: 1)
class AdBanner {
  final String id;
  final String image;
  final String name;
  final String description;

  AdBanner({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });

  factory AdBanner.fromJson(Map<String, dynamic> data) => AdBanner(
        id: data['_id'],
        name: data['name'],
        image: data['image'],
        description: data['description'],
      );
}
