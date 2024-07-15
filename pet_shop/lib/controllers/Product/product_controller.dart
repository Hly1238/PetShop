import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pet_shop/models/Product/category.dart';
import 'package:pet_shop/models/Product/favorite_product.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/servies/Product/category_service.dart';
import 'package:pet_shop/servies/Product/favorite_product_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  // RxList to store list of favorite products
  RxList<FavoriteProduct> favoriteList = <FavoriteProduct>[].obs;
  List<Product> productList = <Product>[].obs;
  // RxBool to track loading state
  RxBool isFavoriteLoading = false.obs;
  RxBool isProductLoading = false.obs;

  // todo [Category]
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() {
    // getFavoriteProduct();
    super.onInit();
  }

  //todo [Fav Products]
  void getFavoriteProduct() async {
    try {
      isFavoriteLoading(true);

      // Fetch data from service
      var results = await FavoriteProductService().get();

      if (results != null && results.statusCode == 200) {
        favoriteList.assignAll(favoriteListFromJson(results.body));
      }
    } catch (e) {
      print("Exception while fetching favorite products: $e");
    } finally {
      isFavoriteLoading(false);
      for (var favorite in favoriteList) {
        productList.add(favorite.product);
      }
      print("Final Favorite length: ${favoriteList.length}");
    }
  }

  //todo [Products in category]
  Future<bool> getProductsByCategory(String id,
      {String? page, String? limit}) async {
    try {
      isProductLoading(true);
      var result =
          await CategoryService().getProductInCategory(id, page, limit);

      if (result != null) {
        productList.assignAll(productListInCate(result.body));
      }
    } catch (e) {
      print("Exception while fetching category with products: $e");
      return false;
    } finally {
      isProductLoading(false);
      print("Final Products list In Cate length: ${productList.length}");
      return true;
    }
  }
}
