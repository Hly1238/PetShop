import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/components/Header/header_appbar.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/screen/Product/components/product_loading_grid.dart';
import 'package:pet_shop/screen/Product/components/product_showing_grid.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  ProductController productController = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    productController.getAllFavoriteProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.lightBackgroundColor_Home,
      appBar: Header_Appbar(
        context: context,
        isShowingCart: true,
        isBack: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.favoriteList.isNotEmpty) {
                return ProductShowingGrid(
                    productList: productController.favoriteList);
              } else {
                return ProductLoadingGrid();
              }
            }),
          ),
        ],
      ),
    );
  }
}
