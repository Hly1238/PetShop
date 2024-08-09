// ![Payment]
class ZaloPayConfig {
  static const String appId = "2553";
  static const String key1 = "PcY4iZIKFCIdgZvA6ueMcMHHUbRLYjPL";
  static const String key2 = "kLtgPl8HHhfvMuDHPwKfgfsY4Ydm9eIz";

  static const String appUser = "Pet Shop";
  static int transIdDefault = 1;
}

class Config {
  // ! [Notification]
  static const String oneSignalApp = "e8134ccc-3926-4e95-9b88-b697078421df";
  static const String addDevice = "/api/user/add_device";
  //! Server
  static const String appName = "Shopping App";
  static const String apiURL = "192.168.1.191:3100";

  //!News
  static const String bannerAPI = "/api/news/search";
  static const String bannerNewAPI = "/api/news/searchNew";
  static const String getBannerIdAPI = "/api/news/";
  //!Register
  static const String apiSignUp = "/api/auth/register";
  //!Login--hết giờ
  static const String loginAPI = "/api/auth/login";
  static const String activateAPI = "/api/auth/activate/";

  //! Forget password
  static const String getOtpAPI = "/api/auth/forget_password";
  static const String verifyOtpAPI = "/api/auth/verify_otp";
  static const String updatePassOtpAPI = "/api/auth/update_forget_password";

  // ! Category
  static const String categoryAPI = "/api/category/searchMobile";
  static const String categorySearchByName = "/api/category/searchByNameMobile";
  static const String categoryContainProducts = "/api/category/productsM/";
  static const String searchProductsBySlug = "/api/category/searchBySlug/";
  // http://localhost:3100/api/category/products/6694177f68ad0eb07017e421?page=1&&limit=1

  // ! Profile
  static const String getProfile = "/api/user/profile";
  static const String updatePasswordAPI = "/api/auth/update_password";

  // ! Product
  static const String productAPI = "/api/product/search";
  static const String productSearchName = "/api/product/searchByNameMobile/";
  static const String productSearchPrice = "/api/product/searchByPrice/";
  static const String recommendedProduct = "/api/product/recommend/";
  static const String getNewProduct = "/api/product/getNewProduct/";
  static const String getPopularProduct = "/api/product/getPopularProduct";
  static const String getHighRecommendProduct =
      "/api/product/getHighRecommendProduct";
  static const String filterProduct = "/api/product/filterProduct";

  // !Comment
  static const String productGetReviews = "/api/product/";
  static const String productPostReviews = '/api/product/';

  //!Order
  // ? post
  static const String createOrderAPI = "/api/order";
  static const String getUserOrder = "/api/order/user";
  static const String getLastestAddress = "/api/order/latestOrderAddress";
  static const String getOrderStauts = "/api/order/viewM/";
  static const String getUnreviewdItem = "/api/order/getUnreviewdItem";
  static const String updateIsConfirm = "/api/order/updateConfirm";
  //http://localhost:3100/api/order/change-state/66954066178464e463889d48

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
