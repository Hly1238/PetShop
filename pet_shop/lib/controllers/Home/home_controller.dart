import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pet_shop/models/Home/Banners/ad_banner.dart';
import 'package:pet_shop/models/Product/category.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/servies/Home/Banners/banners_service.dart';
import 'package:pet_shop/servies/Product/category_service.dart';
import 'package:pet_shop/servies/Product/product_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  //todo [Banners]
  // RxList để lưu trữ danh sách các banner
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  // RxBool để theo dõi trạng thái đang tải banner
  RxBool isBannerLoading = false.obs;

  //todo [Category]
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  //todo [Product]
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getBanners();
    getCategory();
    getProduct();
    super.onInit();
  }

  void getBanners() async {
    try {
      isBannerLoading(true);
      var result = await BannersService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
      } else {
        print("Failed to load banners: result is null");
      }
    } catch (e) {
      print("Error loading banners: $e");
    } finally {
      isBannerLoading(false);
      print("Final bannerList length: ${bannerList.length}");
    }
  }

  void getCategory() async {
    try {
      isCategoryLoading(true);
      var result = await CategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
      } else {
        print("Failed to load cate: result is null");
      }
    } catch (e) {
      print("Error loading cate: $e");
    } finally {
      isCategoryLoading(false);
      print("Final category length: ${categoryList.length}");
    }
  }

  void getProduct() async {
    try {
      isProductLoading(true);
      var result = await ProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      } else {
        print("Failed to load product: result is null");
      }
    } catch (e) {
      print("Error loading product: $e");
    } finally {
      isProductLoading(false);
      print("Final product length: ${productList.length}");
    }
  }
}
