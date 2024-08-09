import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_shop/config/validators/transform.dart';
import 'package:pet_shop/screen/Home/components/selection_component/selection_title.dart';
import 'package:pet_shop/screen/Product/components/product_showing_grid.dart';
import 'package:readmore/readmore.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pet_shop/components/Header/header_appbar.dart';
import 'package:pet_shop/screen/Product/product_detail_popup.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/controllers/Account/auth_controller.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/Product/Review/product_review_screen.dart';
import 'package:pet_shop/screen/Product/components/product_info_column.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProduct extends StatefulWidget {
  final Product product;
  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  ProductController proController = Get.find<ProductController>();

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
    getData();
  }

  void getData() async {
    await proController.getRecommendProduct(widget.product.id);
    await proController.getProductReview(widget.product.id);
    await proController.getFavOfProduct(widget.product.id);
  }

  String phoneNumber = "0901807173";

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
            padding: EdgeInsets.all(10),
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
                // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Text(
                            widget.product.name,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w900,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Số lượng: (${widget.product.quantity})",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${TransformCustomApp().formatCurrency(widget.product.promotion.toInt())}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.yellow[300]),
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsetsDirectional.all(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  widget.product.category.name,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Obx(
                                  () {
                                    bool isFavorite =
                                        ProductController.instance.isFav.value;
                                    return _buildActionIcon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      isFavorite
                                          ? Color(0xFFDB3022)
                                          : Colors.grey,
                                      () {
                                        if (AuthController.instance.isLogin ==
                                            false) {
                                          Navigator.of(context)
                                              .pushNamed(Routes.sign_in);
                                        } else {
                                          ProductController.instance
                                              .updateFavOfProduct(
                                                  widget.product.id);
                                        }
                                      },
                                      BorderRadius.circular(10),
                                    );
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    checkpermission_call(phoneNumber);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 7),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0x1F989797),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.call,
                                        color: Color(0xFFDB3022),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ]),
                ),
                // !!!!!!!!!!!!!!!!!!!
                Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Các thành phần",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Container(
                      child: Wrap(
                        spacing: 15.0,
                        runSpacing: 15.0,
                        children:
                            List.generate(widget.product.color.length, (index) {
                          return Container(
                            child: InfoColumn(
                              value: widget.product.color[index],
                              color: Colors.yellow,
                            ),
                          );
                        }),
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle button press
                          },
                          iconAlignment: IconAlignment.end,
                          icon: Icon(Icons.check, color: Colors.white),
                          label: Text('Vaccinated',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green, // Set the button background color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: HtmlWidget(
                        widget.product.description,
                        customWidgetBuilder: (element) {
                          return ReadMoreText(
                            element.text,
                            trimLines: 5,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '\n Xem thêm',
                            trimExpandedText: '\n Thu nhỏ',
                            moreStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          );
                        },
                      ),
                    ),
                  ]),
                ),

                //todo [Rating Star]
                SizedBox(height: 20),
                Obx(() {
                  if (ProductController.instance.reviewList.isNotEmpty) {
                    return Review_Product(
                      reviewList: ProductController.instance.reviewList,
                    );
                  } else {
                    return Review_Product(
                      reviewList: [],
                    );
                  }
                }),
                // //todo [Recommend]
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SelectionTitle(name: "Sản phẩm liên quan"),
                      Obx(() {
                        final products =
                            ProductController.instance.productRecommended;
                        print('Products: ${products.length}'); // Debug print
                        if (products.isNotEmpty) {
                          return ProductShowingGrid(productList: products);
                        } else {
                          return Container(
                            height: 50,
                            child: Center(
                              child: Text("Chưa tìm được sản phẩm phù hợp"),
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ProductDetailPopup(
                productId: widget.product.id,
                price: widget.product.promotion,
                quantity: widget.product.quantity,
                productImg: widget.product.image,
                productName: widget.product.name,
              ),
            ),
            SizedBox(width: 6),
            GestureDetector(
              onTap: () {
                String url = "ahihi";
                handleShareInfo(url);
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0x1F989797),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.share,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcon(
      IconData icon, Color color, VoidCallback onPressed, BorderRadius border) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 50,
        width: 50,
        decoration:
            BoxDecoration(color: Color(0x1F989797), borderRadius: border),
        child: Center(
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }

  //todo [Handle Phone Call]
  checkpermission_call(String number) async {
    var phoneStatus = await Permission.phone.status;
    if (!phoneStatus.isGranted) await Permission.phone.request();
    if (await Permission.phone.isGranted) {
      makeACallToShop(number);
    } else {
      showToast(
        "Bạn chưa cấp quyền để thực hiện việc gọi",
        position: ToastPosition.bottom,
      );
    }
  }

  void makeACallToShop(String number) async {
    Uri dialNumber = Uri(scheme: 'tel', path: number);
    await launchUrl(dialNumber);
  }

  //todo [Handle Share]
  void handleShareInfo(String url) async {
    await Share.share('Check out this one $url');
  }
}
