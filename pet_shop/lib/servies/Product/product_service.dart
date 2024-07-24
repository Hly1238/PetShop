import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';

class ProductService {
  var client = http.Client();

  Future<dynamic> getAll() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.productAPI);

    var response = await client.post(url, headers: requestHeaders);
    return response;
  }

  // todo [Search]
  Future<dynamic> searchByName(
      String regrex, String? page, String? limit) async {
    final queryParameters = {
      if (page != null && page.isNotEmpty) 'page': page,
      if (limit != null && limit.isNotEmpty) 'limit': limit,
      'name': regrex
    };
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url =
        Uri.http(Config.apiURL, Config.productSearchName, queryParameters);
    var response = await client.get(url, headers: requestHeaders);
    return response;
  }

  Future<dynamic> searchByPrice(
      double min, double max, String? page, String? limit) async {
    final queryParameters = {
      if (page != null && page.isNotEmpty) 'page': page,
      if (limit != null && limit.isNotEmpty) 'limit': limit,
      'minPrice': min,
      "maxPrice": max
    };
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.productSearchPrice);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(queryParameters));
    return response;
  }

  //Todo [Reviews of product]
  Future<dynamic> searchReviewsOfProduct(
      String productId, String? page, String? limit) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(
        Config.apiURL, Config.productGetReviews + '$productId/reviews');
    var response = await client.get(url, headers: requestHeaders);
    return response;
  }
}
