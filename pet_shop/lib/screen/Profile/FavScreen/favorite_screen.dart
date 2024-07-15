import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/components/Header/header_appbar.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/screen/Product/components/product_loading_grid.dart';
import 'package:pet_shop/screen/Product/components/product_showing_grid.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Get.put(ProductController());

    return Scaffold(
      appBar: Header_Appbar(
        context: context,
        isShowingCart: true,
        isBack: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (ProductController.instance.favoriteList.isNotEmpty) {
                return ProductShowingGrid(
                    productList: ProductController.instance.productList);
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
