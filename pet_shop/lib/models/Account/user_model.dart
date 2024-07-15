import 'dart:convert';
import 'package:hive/hive.dart';

List<UserModel> userFromJson(String val) => List<UserModel>.from(
    json.decode(val)['data'].map((user) => UserModel.fromJson(user)));

@HiveType(typeId: 1)
class UserModel {
  final String id;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String role;
  final String status;
  final String image;

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        id: data['_id'],
        email: data['email'],
        phone: data['phone'],
        username: data['username'],
        password: data['password'],
        role: data['role'],
        status: data['status'],
        image: data['image'],
      );

  UserModel(
      {required this.id,
      required this.email,
      required this.phone,
      required this.username,
      required this.password,
      required this.role,
      required this.status,
      required this.image});
}
