// import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:pet_shop/components/Header/header_appbar.dart';
// import 'package:pet_shop/components/product_detail_popup.dart';
// import 'package:pet_shop/config/constant.dart';
// import 'package:pet_shop/models/Product/product.dart';
// import 'package:pet_shop/screen/Product/Review/product_review_screen.dart';

// class DetailProduct extends StatefulWidget {
//   final Product product;
//   const DetailProduct({Key? key, required this.product}) : super(key: key);

//   @override
//   _DetailProductState createState() => _DetailProductState();
// }

// class _DetailProductState extends State<DetailProduct> {
//   List<String> imageList = [
//     "assets/images/_project/Products/food_1.jpg",
//     "assets/images/_project/Products/food_2.jpg",
//     "assets/images/_project/Products/food_3.jpg",
//     "assets/images/_project/Products/food_4.jpg"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Header_Appbar(
//         context: context,
//         name: "",
//         isShowingCart: true,
//       ),
//       backgroundColor: CustomAppColor.lightBackgroundColor_Home,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Stack(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 450,
//                       width: MediaQuery.of(context).size.width,
//                       child: FanCarouselImageSlider.sliderType1(
//                         sliderHeight: 430,
//                         autoPlay: true,
//                         imagesLink: imageList,
//                         isAssets: true,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 30,
//                             ),
//                             Text(
//                               widget.product.name,
//                               style: TextStyle(
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 25),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               widget.product.category.name,
//                               style: TextStyle(
//                                   color: Colors.black54,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           '${widget.product.price}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25,
//                               color: Color(0xFFDB3022)),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: RatingBarIndicator(
//                         rating: 5,
//                         itemBuilder: (context, index) => Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         itemCount: 5,
//                         itemSize: 25,
//                         direction: Axis.horizontal,
//                         itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         widget.product.description,
//                         style: TextStyle(
//                             color: Colors.black54,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 60,
//                           width: 60,
//                           decoration: BoxDecoration(
//                               color: Color(0x1F989797),
//                               borderRadius: BorderRadius.circular(30)),
//                           child: Center(
//                             child: Icon(
//                               Icons.shopping_cart,
//                               color: Color(0xFFDB3022),
//                             ),
//                           ),
//                         ),
//                         ProductDetailPopup(),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Review_Product()
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: ProductDetailPopup(),

//       // Padding(
//       //   padding: EdgeInsets.all(6.0),
//       //   child: TextButton(
//       //     style: ButtonStyle(
//       //       backgroundColor: MaterialStateProperty.all<Color>(
//       //           Theme.of(context).primaryColor),
//       //     ),
//       //     onPressed: () {},
//       //     child: Padding(
//       //       padding: EdgeInsets.all(6.0),
//       //       child: Text(
//       //         'Add',
//       //         style: TextStyle(fontSize: 16),
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
// !!!!!!!!!!
// import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:pet_shop/components/Header/header_appbar.dart';
// import 'package:pet_shop/components/product_detail_popup.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// import 'package:pet_shop/config/constant.dart';
// import 'package:pet_shop/controllers/Account/auth_controller.dart';
// import 'package:pet_shop/controllers/Product/product_controller.dart';
// import 'package:pet_shop/models/Product/product.dart';
// import 'package:pet_shop/route/route_generator.dart';
// import 'package:pet_shop/screen/Product/Review/product_review_screen.dart';

// class DetailProduct extends StatefulWidget {
//   final Product product;
//   const DetailProduct({Key? key, required this.product}) : super(key: key);

//   @override
//   _DetailProductState createState() => _DetailProductState();
// }

// class _DetailProductState extends State<DetailProduct> {
//   List<String> imageList = [
//     "assets/images/_project/Products/food_1.jpg",
//     "assets/images/_project/Products/food_2.jpg",
//     "assets/images/_project/Products/food_3.jpg",
//     "assets/images/_project/Products/food_4.jpg"
//   ];

//   // Column(
//   //               children: items
//   //                   .map(
//   //                     (item) => ItemRow(
//   //                       imageUrl: item.product.image,
//   //                       title: item.product.name,
//   //                       price: '${item.product.promotion}',
//   //                     ),
//   //                   )
//   //                   .toList(),
//   //             ),

//   bool isFavorite = false;
//   @override
//   void initState() {
//     super.initState();

//     ProductController.instance.getProductReview(widget.product.id);

//     ProductController.instance.getFavOfProduct(widget.product.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     int initialPageIndex = 0; // Example: set to 0 as default

//     initialPageIndex =
//         initialPageIndex.clamp(0, widget.product.slide.length - 1);

//     for (var element in widget.product.slide) {
//       print(element);
//     }

//     return Scaffold(
//       appBar: Header_Appbar(
//         context: context,
//         name: "",
//         isShowingCart: true,
//       ),
//       backgroundColor: CustomAppColor.lightBackgroundColor_Home,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 250,
//                   width: MediaQuery.of(context).size.width,
//                   child: FanCarouselImageSlider.sliderType1(
//                     sliderHeight: 250,
//                     autoPlay: true,
//                     imagesLink: widget.product.slide,
//                     isAssets: false,
//                     initalPageIndex:
//                         initialPageIndex, // Pass the calculated initialPageIndex
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.product.name,
//                           style: TextStyle(
//                               color: Colors.black87,
//                               fontWeight: FontWeight.w900,
//                               fontSize: 22),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           widget.product.category.name,
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       '\$${widget.product.promotion}',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                           color: Color(0xFFDB3022)),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     // RatingBarIndicator(
//                     //   rating: 5,
//                     //   itemBuilder: (context, index) => Icon(
//                     //     Icons.star,
//                     //     color: Colors.amber,
//                     //   ),
//                     //   itemCount: 5,
//                     //   itemSize: 25,
//                     //   direction: Axis.horizontal,
//                     //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
//                     // ),

//                     SizedBox(width: 5),
//                     Text(
//                       // '(42) | Sold 549',
//                       '',
//                       style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 // `Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 //   children: [
//                 //     _buildAttributeCard('Male', 'Gender'),
//                 //     _buildAttributeCard('2 months', 'Age'),
//                 //     _buildAttributeCard('8 Kg', 'Weight'),
//                 //   ],
//                 // ),`

//                 SizedBox(height: 20),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: HtmlWidget(
//                     widget.product.description,
//                     textStyle: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black, // Màu chữ đen
//                     ),
//                     customWidgetBuilder: (element) {
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 // Row(
//                 //   children: [
//                 //     _buildStatusCard('Vaccinated', Colors.green),
//                 //   ],
//                 // ),
//                 // SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Obx(() {
//                       bool isFavorite = ProductController.instance.isFav.value;
//                       return _buildActionIcon(
//                         isFavorite ? Icons.favorite : Icons.favorite_border,
//                         isFavorite ? Color(0xFFDB3022) : Colors.grey,
//                         () {
//                           if (AuthController.instance.isLogin == false) {
//                             Navigator.of(context).pushNamed(Routes.sign_in);
//                           } else {
//                             ProductController.instance
//                                 .updateFavOfProduct(widget.product.id);
//                           }
//                         },
//                       );
//                     }),
//                     _buildActionIcon(Icons.phone, Colors.grey, () {}),
//                   ],
//                 ),
//                 // SizedBox(height: 10),
//                 // Align(
//                 //   alignment: Alignment.centerLeft,
//                 //   child: Row(
//                 //     children: [
//                 //       Icon(Icons.location_on, color: Colors.grey),
//                 //       SizedBox(width: 5),
//                 //       Text(
//                 //         '420 Walter street, Washington DC',
//                 //         style: TextStyle(color: Colors.grey),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // SizedBox(height: 10),
//                 // Align(
//                 //   alignment: Alignment.centerLeft,
//                 //   child: Text(
//                 //     'About Dubby',
//                 //     style: TextStyle(
//                 //         color: Colors.black87,
//                 //         fontWeight: FontWeight.w700,
//                 //         fontSize: 18),
//                 //   ),
//                 // ),

//                 SizedBox(height: 20),

//                 //todo [Review]
//                 // Review_Product(ProductController.instance.reviewList),
//                 Obx(() {
//                   if (ProductController.instance.reviewList.isNotEmpty) {
//                     return Review_Product(
//                       reviewList: ProductController.instance.reviewList,
//                     );
//                   } else {
//                     return Container();
//                   }
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: ProductDetailPopup(
//         productId: widget.product.id,
//         price: widget.product.promotion,
//         quantity: widget.product.quantity,
//       ),
//     );
//   }

//   Widget _buildAttributeCard(String value, String attribute) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: TextStyle(
//               color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 16),
//         ),
//         SizedBox(height: 5),
//         Text(
//           attribute,
//           style: TextStyle(color: Colors.grey, fontSize: 14),
//         ),
//       ],
//     );
//   }

//   Widget _buildStatusCard(String status, Color color) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Text(
//         status,
//         style: TextStyle(color: color, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildActionIcon(IconData icon, Color color, VoidCallback onPressed) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 60,
//         width: 60,
//         decoration: BoxDecoration(
//             color: Color(0x1F989797), borderRadius: BorderRadius.circular(30)),
//         child: Center(
//           child: Icon(
//             icon,
//             color: color,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pet_shop/components/Header/header_appbar.dart';
import 'package:pet_shop/components/product_detail_popup.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/route/route_generator.dart';
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

  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    ProductController.instance.getProductReview(widget.product.id);
    ProductController.instance.getFavOfProduct(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    int initialPageIndex = 0;
    initialPageIndex =
        initialPageIndex.clamp(0, widget.product.slide.length - 1);

    return Scaffold(
      appBar: Header_Appbar(
        context: context,
        name: "",
        isShowingCart: true,
      ),
      backgroundColor: CustomAppColor.lightBackgroundColor_Home,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: FanCarouselImageSlider.sliderType1(
                    sliderHeight: 250,
                    autoPlay: true,
                    imagesLink: widget.product.slide,
                    isAssets: false,
                    initalPageIndex: initialPageIndex,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.product.category.name,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Obx(() {
                      bool isFavorite = ProductController.instance.isFav.value;
                      return _buildActionIcon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        isFavorite ? Color(0xFFDB3022) : Colors.grey,
                        () {
                          if (AuthController.instance.isLogin == false) {
                            Navigator.of(context).pushNamed(Routes.sign_in);
                          } else {
                            ProductController.instance
                                .updateFavOfProduct(widget.product.id);
                          }
                        },
                      );
                    }),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '\$${widget.product.promotion}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFFDB3022)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      '',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: HtmlWidget(
                    widget.product.description,
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    customWidgetBuilder: (element) {
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     _buildActionIcon(Icons.phone, Colors.grey, () {}),
                //   ],
                // ),
                SizedBox(height: 20),
                Obx(() {
                  if (ProductController.instance.reviewList.isNotEmpty) {
                    return Review_Product(
                      reviewList: ProductController.instance.reviewList,
                    );
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ProductDetailPopup(
        productId: widget.product.id,
        price: widget.product.promotion,
        quantity: widget.product.quantity,
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, Color color, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Color(0x1F989797), borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
