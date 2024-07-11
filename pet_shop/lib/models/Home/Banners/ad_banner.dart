import 'dart:convert';
import 'package:hive/hive.dart';
// part 'ad_banner.g.dart';

List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
    json.decode(val)['data'].map((banner) => AdBanner.fromJson(banner)));

@HiveType(typeId: 1)
class AdBanner {
  @HiveType(typeId: 0)
  final String id;
  @HiveType(typeId: 1)
  final String image;

  AdBanner({
    required this.id,
    required this.image,
  });

  factory AdBanner.fromJson(Map<String, dynamic> data) =>
      AdBanner(id: data['_id'], image: data['BannerImage']);
}
