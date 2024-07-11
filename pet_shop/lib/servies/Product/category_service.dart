import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';

class CategoryService {
  var client = http.Client();
  var url = Uri.http(Config.apiURL, Config.categoryAPI);

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$url'));
    return response;
  }
}
