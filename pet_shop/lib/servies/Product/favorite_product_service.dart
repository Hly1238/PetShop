import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';

class FavoriteProductService {
  var client = http.Client();
  AuthController authController = Get.find<AuthController>();

  Future<dynamic> getAll() async {
    var url = Uri.http(Config.apiURL, Config.favoriteGetAllAPI);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response =
        await client.get(Uri.parse('${url}'), headers: requestHeaders);
    return response;
  }

  Future<dynamic> getFavOfProduct(String id) async {
    var url = Uri.http(Config.apiURL, Config.favoriteAPI + id);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response =
        await client.get(Uri.parse('${url}'), headers: requestHeaders);
    return response;
  }

  Future<dynamic> updateFav(String id) async {
    var url = Uri.http(Config.apiURL, Config.updateFavAPI + id);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${authController.token}',
    };
    var response =
        await client.put(Uri.parse('${url}'), headers: requestHeaders);
    return response;
  }
}
