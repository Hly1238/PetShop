import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/controllers/Home/home_controller.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/screen/Home/components/carousel_slider/carousel_loading.dart';
import 'package:pet_shop/screen/Home/components/carousel_slider/carousel_slider_view.dart';
import 'package:pet_shop/screen/Home/components/category/category_loading.dart';
import 'package:pet_shop/screen/Home/components/category/category_showing.dart';
import 'package:pet_shop/screen/Home/components/selection_component/selection_title.dart';
import 'package:pet_shop/screen/Product/components/product_loading.dart';
import 'package:pet_shop/screen/Product/components/product_showing.dart';

import '../../components/Header/header_appbar.dart';
import '../../models/Product/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Product> sampleProducts = [
      Product(
        id: '1',
        name: 'Dog Food',
        description: 'High quality dog food.',
        image: 'dog_food.png',
        price: 20.0,
        promotion: 5.0,
        quantity: 100,
        slide: ['dog_food_slide.png'],
        color: ['Red', 'Blue'],
        category: Category(
          id: '1',
          name: 'Food',
          image: '',
          description: '',
          slug: '',
        ),
      ),
      Product(
        id: '2',
        name: 'Cat Toy',
        description: 'Fun toy for cats.',
        image: 'cat_toy.png',
        price: 10.0,
        promotion: 3.0,
        quantity: 200,
        slide: ['cat_toy_slide.png'],
        color: ['Green', 'Yellow'],
        category: Category(
          id: '2',
          name: 'Toys',
          image: '',
          description: '',
          slug: '',
        ),
      ),
      Product(
        id: '3',
        name: 'Bird Cage',
        description: 'Spacious bird cage.',
        image: 'bird_cage.png',
        price: 50.0,
        promotion: 10.0,
        quantity: 50,
        slide: ['bird_cage_slide.png'],
        color: ['White', 'Black'],
        category: Category(
          id: '3',
          name: 'Accessories',
          image: '',
          description: '',
          slug: '',
        ),
      ),
    ];

    return Scaffold(
      appBar: Header_Appbar(
        context: context,
        isBack: false,
        isShowingCart: true,
        id: "Yêu Thích",
      ),
      backgroundColor: CustomAppColor.lightBackgroundColor_Home,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              //todo: [Banners Loading]
              Obx(() {
                //? Show
                if (HomeController.instance.bannerList.isNotEmpty) {
                  return CarouselSliderView(
                      bannerList: HomeController.instance.bannerList);
                }
                //? Loading
                else {
                  return CarouselLoading();
                }
              }),

              //todo [Category]
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    SelectionTitle(isCategory: true, name: "Thể loại"),
                    Obx(() {
                      //? Show
                      if (HomeController.instance.categoryList.isNotEmpty) {
                        return CategoryShowing(
                            categories: HomeController.instance.categoryList);
                      }
                      //? Loading
                      else {
                        return CategoryLoading();
                      }
                    }),
                  ],
                ),
              ),

              // todo [List Product By Category]
              // GestureDetector(
              //   onTap: () {
              //     // ProductController.instance
              //     //     .getProductsByCategory("669616d55fb2af72ada6888e");
              //     // ProductController.instance
              //     //     .getProductByName("o", page: "1", limit: "10000");
              //     // ProductController.instance
              //     //     .getProductByPrice(50, 500, page: "1", limit: "10000");
              //     // ProductController.instance
              //     //     .getProductReview("669617705fb2af72ada688bc");
              //   },
              //   child: Container(
              //     height: 100,
              //     width: 100,
              //     color: Colors.amber,
              //   ),
              // ),

              //todo [Product]
              SizedBox(height: 20),

              Obx(() {
                if (HomeController.instance.categoryList.isNotEmpty) {
                  return Column(
                    children:
                        HomeController.instance.categoryList.map((category) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            SelectionTitle(
                              name: category.name,
                              id: category.id,
                            ),
                            Obx(() {
                              final productsByCategory = HomeController
                                  .instance.productList
                                  .where((product) =>
                                      product.category.id == category.id)
                                  .toList();
                              //? Show
                              if (productsByCategory.isNotEmpty) {
                                return ProductShowing(
                                    productList: productsByCategory);
                              }
                              //? Loading
                              else {
                                return ProductLoading();
                              }
                            }),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
