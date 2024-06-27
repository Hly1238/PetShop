import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';

class BannersService {
  var client = http.Client();
  var url = Uri.http(Config.apiURL, Config.loginAPI);

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$url?populate=image'));
    return response;
  }
}
