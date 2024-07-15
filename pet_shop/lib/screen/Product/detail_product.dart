import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_shop/components/Header/header_appbar.dart';
import 'package:pet_shop/components/product_detail_popup.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/screen/Product/Review/product_review_screen.dart';

class DetailProduct extends StatefulWidget {
  final Product product;
  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List<String> imageList = [
    "assets/images/_project/Products/food_1.jpg",
    "assets/images/_project/Products/food_2.jpg",
    "assets/images/_project/Products/food_3.jpg",
    "assets/images/_project/Products/food_4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header_Appbar(
        context: context,
        name: "",
        isShowingCart: true,
      ),
      backgroundColor: CustomAppColor.lightBackgroundColor_Home,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 450,
                      width: MediaQuery.of(context).size.width,
                      child: FanCarouselImageSlider.sliderType1(
                        sliderHeight: 430,
                        autoPlay: true,
                        imagesLink: imageList,
                        isAssets: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.product.category.name,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          '${widget.product.price}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xFFDB3022)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RatingBarIndicator(
                        rating: 5,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25,
                        direction: Axis.horizontal,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.description,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0x1F989797),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Icon(
                              Icons.shopping_cart,
                              color: Color(0xFFDB3022),
                            ),
                          ),
                        ),
                        ProductDetailPopup(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Review_Product()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProductDetailPopup(),

      // Padding(
      //   padding: EdgeInsets.all(6.0),
      //   child: TextButton(
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all<Color>(
      //           Theme.of(context).primaryColor),
      //     ),
      //     onPressed: () {},
      //     child: Padding(
      //       padding: EdgeInsets.all(6.0),
      //       child: Text(
      //         'Add',
      //         style: TextStyle(fontSize: 16),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
