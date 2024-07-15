import 'package:http/http.dart' as http;
import 'package:pet_shop/config/cofig.dart';

class FavoriteProductService {
  var client = http.Client();
  var url = Uri.http(Config.apiURL, Config.favoriteAPI);

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('${url}665e9ed3c97e20b10d0a2878'));
    return response;
  }
}
