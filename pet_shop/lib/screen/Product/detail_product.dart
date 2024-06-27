import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_shop/components/product_detail_popup.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text("Details"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
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
                          "Warm Zipper",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Milu Milu",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      "\$300",
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
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
