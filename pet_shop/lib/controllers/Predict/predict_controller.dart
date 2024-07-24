import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pet_shop/models/Home/Banners/ad_banner.dart';
import 'package:pet_shop/models/ModelPredict/model_product.dart';
import 'package:pet_shop/models/Product/category.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/servies/Home/Banners/banners_service.dart';
import 'package:pet_shop/servies/ModelPredict/predict_service.dart';
import 'package:pet_shop/servies/Product/category_service.dart';
import 'package:pet_shop/servies/Product/product_service.dart';

class PredictController extends GetxController {
  static PredictController instance = Get.find();
  RxList<ModelProduct> predList = List<ModelProduct>.empty(growable: true).obs;
  RxBool isPredictLoading = false.obs;

  void predict(Uint8List bytes, String fileName) async {
    try {
      isPredictLoading(true);
      var result = await PredictService().predict(bytes, fileName);

      if (result != null) {
        predList.assignAll(predListFromJson(result));
      } else {
        print("Failed to load banners: result is null");
      }
    } catch (e) {
      print("Error loading banners: $e");
    } finally {
      isPredictLoading(false);
      print("Final bannerList length: ${predList.length}");
    }
  }
}
