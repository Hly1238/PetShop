import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';

class CategoryService {
  var client = http.Client();

  Future<dynamic> get() async {
    var url = Uri.http(Config.apiURL, Config.categoryAPI);

    var response = await client.get(Uri.parse('$url'));

    return response;
  }

  Future<dynamic> getProductInCategory(
      String _id, String? page, String? limit) async {
    final queryParameters = {
      if (page != null && page.isNotEmpty) 'page': page,
      if (limit != null && limit.isNotEmpty) 'limit': limit,
    };

    var url = Uri.http(
        Config.apiURL, Config.categoryContainProducts + _id, queryParameters);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var response =
        await client.post(url, headers: requestHeaders, body: jsonEncode({}));

    return response;
  }
}
