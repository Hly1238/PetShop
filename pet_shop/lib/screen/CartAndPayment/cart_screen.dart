import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/components/container_button_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> imageList = [
    "assets/images/_project/Products/food_1.jpg",
    "assets/images/_project/Products/food_2.jpg",
    "assets/images/_project/Products/food_3.jpg",
    "assets/images/_project/Products/food_4.jpg"
  ];
  List productTitles = [
    "Warm Zipper",
    "Knitter Woo",
    "Zipper Win",
    "Child Win"
  ];
  List prices = ["\$300", "\$300", "\$300", "\$300"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                // height: 200,
                child: ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (val) {},
                              splashRadius: 20,
                              activeColor: Color(0xFFDB3022),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                imageList[index],
                                height: 100,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productTitles[index],
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Milu Milu",
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(prices[index],
                                    style: TextStyle(
                                        color: Color(0xFFDB3022),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  CupertinoIcons.plus,
                                  color: Color(0xFFDB3022),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select All",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                    splashRadius: 20,
                    activeColor: Color(0xFFDB3022),
                  )
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Payment",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text("\$400",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFDB3022)))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {},
                  child: ContainerButtonModel(
                    itext: "Check Out",
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: Color(0xFFDB3022),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
