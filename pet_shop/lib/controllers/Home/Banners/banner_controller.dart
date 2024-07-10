import 'package:get/get.dart';
import 'package:pet_shop/models/Home/Banners/ad_banner.dart';
import 'package:pet_shop/servies/Home/Banners/banners_service.dart';

class BannerController extends GetxController {
  static BannerController instance = Get.find();

  // RxList để lưu trữ danh sách các banner
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  // RxBool để theo dõi trạng thái đang tải banner
  RxBool isBannerLoading = false.obs;

  @override
  void onInit() {
    getBanners();
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
}
