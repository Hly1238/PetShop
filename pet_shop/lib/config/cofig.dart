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

  //!Login
  static const String loginAPI = "/api/u/login";
  static const String bannerAPI = "api/product/banners";

  // ! Category
  static const String categoryAPI = "/api/category/searchMobile";
  static const String categorySearchByName = "/api/category/searchByName";
  static const String categoryContainProducts = "/api/category/products/";
  // http://localhost:3100/api/category/products/6694177f68ad0eb07017e421?page=1&&limit=1

  // ? token
  // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY2OTQxNDkwNjhhZDBlYjA3MDE3ZTQxYSIsImVtYWlsIjoicmVxIiwicGhvbmUiOiIwOTA5MDkwOTA5IiwidXNlcm5hbWUiOiIxMjMiLCJwYXNzd29yZCI6IiQyYiQxMCRYVFJLQ0NIY2drSWVrSHJWZUlEdXguMDdVNnFlOG5EQlVxWllYbGhoajdXNk9hR3RFdUZKMiIsInJvbGUiOiIiLCJzdGF0dXMiOiJub2FjdGl2ZSIsImltYWdlIjoiaHR0cHM6Ly96b3MuYWxpcGF5b2JqZWN0cy5jb20vcm1zcG9ydGFsL09EVExjanhBZnZxYnhIblZYQ1lYLnBuZyIsImNyZWF0ZWRBdCI6IjIwMjQtMDctMTRUMTg6MTA6MjQuODg2WiIsInVwZGF0ZWRBdCI6IjIwMjQtMDctMTRUMTg6MTA6MjQuODg2WiIsIl9fdiI6MH0sImlhdCI6MTcyMDk4MDcyNiwiZXhwIjoxNzMwOTgwNzI2fQ.uYGms9xoS5kPEKrQ5WH-jUOYMo9PYbv0JwNzsu1i5uI //req.headers.authorization

  //! Login
  // http://localhost:3100/api/auth/login

  // ! Profile
  // http://localhost:3100/api/user/profile

  // ! Product
  static const String productAPI = "/api/product/search";
  //http://localhost:3100/api/product/searchByName?name=eeeeeeeeeee
  //http://localhost:3100/api/product/searchByPrice
  // {
  //     "minPrice": 50,
  // "maxPrice": 500
  // }
  ///recommend/:id
  ///Comment: http://localhost:3100/api/product/66941f97c376073d185ab773/reviews
  ///http://localhost:3100/api/product/66941f97c376073d185ab773/reviews

  //!Order
  static const String createOrderAPI = "/api/order";
  // {
  //     "userId": "6694149068ad0eb07017e41a",
  //     "products": [
  //         {
  //             "product": "66941f8ec376073d185ab770",
  //             "quantity": 2,
  //             "price": 100
  //         },
  //         {
  //             "product": "66941f97c376073d185ab773",
  //             "quantity": 1,
  //             "price": 150
  //         }
  //     ],
  //     "orderTotal": 350,
  //     "address": "123 Main St, Springfield",
  //     "billing": "cod",
  //     "status": "pending",
  //     "description": "This is a sample order"
  // }
  // http://localhost:3100/api/order/user
  // http://localhost:3100/api/order/searchByName?name=350
  // http://localhost:3100/api/order/669486dd598f9574912217dc --sửa

  //Favorite
  static const String favoriteAPI = "api/favourite/u/";
  //Predict
  static const String predict = "/api/model/predict";
}
