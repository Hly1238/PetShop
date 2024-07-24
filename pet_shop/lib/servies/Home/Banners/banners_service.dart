import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';

class BannersService {
  var client = http.Client();
  var url = Uri.http(Config.apiURL, Config.bannerAPI);
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
  };
  Future<dynamic> get() async {
    var response =
        await client.post(Uri.parse('$url'), headers: requestHeaders);
    return response;
  }

  Future<dynamic> getById() async {
    return;
  }
}
