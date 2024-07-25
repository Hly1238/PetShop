final url = 'http://192.168.1.191:3000/';
final registration = url + "api/u/register";
final loginUrl = url + "api/u/login";
final login = url + "api/u/login";

//? Home
//todo [banners]
final banner = url + "api/product/banners";
//todo [category]
final category = url + "api/category/getAll";

class Config {
  static const String appName = "Shopping App";
  static const String apiURL = "192.168.1.191:3100";

  //!Register
  static const String apiSignUp = "/api/auth/register";

  //!Login--hết giờ
  static const String loginAPI = "/api/auth/loginM";
  static const String bannerAPI = "/api/news/search";

  //! Forget password
  static const String getOtpAPI = "/api/auth/forget_password";
  static const String verifyOtpAPI = "/api/auth/verify_otp";
  static const String updatePassOtpAPI = "/api/auth/update_forget_password";

  // ! Category
  static const String categoryAPI = "/api/category/searchMobile";
  static const String categorySearchByName = "/api/category/searchByNameMobile";
  static const String categoryContainProducts = "/api/category/productsM/";
  // http://localhost:3100/api/category/products/6694177f68ad0eb07017e421?page=1&&limit=1

  // ! Profile
  static const String getProfile = "/api/user/profile";
  static const String updatePasswordAPI = "/api/auth/update_password";

  // ! Product
  static const String productAPI = "/api/product/search";
  static const String productSearchName = "/api/product/searchByNameMobile/";
  static const String productSearchPrice = "/api/product/searchByPrice/";

  ///recommend/:id

  // !Comment
  static const String productGetReviews = "/api/product/";
  static const String productPostReviews = '/api/product/';

  ///http://localhost:3100/api/product/66941f97c376073d185ab773/reviews

  //!Order
  // ? post
  static const String createOrderAPI = "/api/order";
  static const String getUserOrder = "/api/order/user";
  static const String getLastestAddress = "/api/order/latestOrderAddress";
  // http://localhost:3100/api/order/view?status=pending
  //http://localhost:3100/api/order/change-state/66954066178464e463889d48
  // }

  // {
  //     "status": "canceled"
  // }

  // http://localhost:3100/api/order/searchByName?name=350
  // http://localhost:3100/api/order/669486dd598f9574912217dc --sửa
  // http://localhost:3100/api/order/ordersByTotal?minTotal=200&maxTotal=500
  // http://localhost:3100/api/order/ordersByMonth?month=6&year=2024
  // http://localhost:3100/api/order/uniqueAddresses

  //!Favorite
  static const String favoriteGetAllAPI = "/api/favourites/getAll";
  static const String favoriteAPI = "api/favourites/";
  static const String updateFavAPI = "api/favourites/";

  //!Cart
  static const String cartAPI = "api/cart/";
  static const String deleteCartAPI = "api/cart/clear";
  static const String subtractCartAPI = "api/cart/sub";

  //!Predict
  static const String predict = "/api/recognize/predict";
}
