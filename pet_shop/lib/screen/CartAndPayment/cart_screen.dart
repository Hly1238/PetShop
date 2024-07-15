// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pet_shop/components/container_button_model.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   List<String> imageList = [
//     "assets/images/_project/Products/food_1.jpg",
//     "assets/images/_project/Products/food_2.jpg",
//     "assets/images/_project/Products/food_3.jpg",
//     "assets/images/_project/Products/food_4.jpg"
//   ];
//   List productTitles = [
//     "Warm Zipper",
//     "Knitter Woo",
//     "Zipper Win",
//     "Child Win"
//   ];
//   List prices = ["\$300", "\$300", "\$300", "\$300"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//         leading: BackButton(),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Container(
//                 // height: 200,
//                 child: ListView.builder(
//                     itemCount: imageList.length,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Checkbox(
//                               value: true,
//                               onChanged: (val) {},
//                               splashRadius: 20,
//                               activeColor: Color(0xFFDB3022),
//                             ),
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                 imageList[index],
//                                 height: 100,
//                                 width: 80,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   productTitles[index],
//                                   style: TextStyle(
//                                       color: Colors.black87,
//                                       fontWeight: FontWeight.w900,
//                                       fontSize: 18),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   "Milu Milu",
//                                   style: TextStyle(
//                                       color: Colors.black26, fontSize: 16),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(prices[index],
//                                     style: TextStyle(
//                                         color: Color(0xFFDB3022),
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w900))
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   CupertinoIcons.minus,
//                                   color: Colors.green,
//                                 ),
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 Text(
//                                   "1",
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Icon(
//                                   CupertinoIcons.plus,
//                                   color: Color(0xFFDB3022),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Select All",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   Checkbox(
//                     value: false,
//                     onChanged: (val) {},
//                     splashRadius: 20,
//                     activeColor: Color(0xFFDB3022),
//                   )
//                 ],
//               ),
//               Divider(
//                 height: 20,
//                 thickness: 1,
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Total Payment",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                   Text("\$400",
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFFDB3022)))
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               InkWell(
//                   onTap: () {},
//                   child: ContainerButtonModel(
//                     itext: "Check Out",
//                     containerWidth: MediaQuery.of(context).size.width,
//                     bgColor: Color(0xFFDB3022),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pet_shop/components/container_button_model.dart';
// import 'package:pet_shop/route/route_generator.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class Product {
//   final String image;
//   final String title;
//   final String price;
//   int quantity;
//   bool selected;

//   Product({
//     required this.image,
//     required this.title,
//     required this.price,
//     this.quantity = 1,
//     this.selected = false,
//   });
// }

// class _CartScreenState extends State<CartScreen> {
//   List<Product> products = [
//     Product(
//         image: "assets/images/_project/Products/food_1.jpg",
//         title: "Warm Zipper",
//         price: "\$300"),
//     Product(
//         image: "assets/images/_project/Products/food_2.jpg",
//         title: "Knitter Woo",
//         price: "\$300"),
//     Product(
//         image: "assets/images/_project/Products/food_3.jpg",
//         title: "Zipper Win",
//         price: "\$300"),
//     Product(
//         image: "assets/images/_project/Products/food_4.jpg",
//         title: "Child Win",
//         price: "\$300"),
//   ];

//   double getTotalPayment() {
//     double total = 0;
//     for (var product in products) {
//       if (product.selected) {
//         total += product.quantity * double.parse(product.price.substring(1));
//       }
//     }
//     return total;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//         leading: BackButton(),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               ListView.builder(
//                 itemCount: products.length,
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Checkbox(
//                           value: products[index].selected,
//                           onChanged: (val) {
//                             setState(() {
//                               products[index].selected = val!;
//                             });
//                           },
//                           splashRadius: 20,
//                           activeColor: Color(0xFFDB3022),
//                         ),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             products[index].image,
//                             height: 100,
//                             width: 80,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               products[index].title,
//                               style: TextStyle(
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 18),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               "Milu Milu",
//                               style: TextStyle(
//                                   color: Colors.black26, fontSize: 16),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "\$${(products[index].quantity * double.parse(products[index].price.substring(1))).toStringAsFixed(2)}",
//                               style: TextStyle(
//                                   color: Color(0xFFDB3022),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w900),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: Icon(CupertinoIcons.minus,
//                                   color: Colors.green),
//                               onPressed: () {
//                                 setState(() {
//                                   if (products[index].quantity > 1) {
//                                     products[index].quantity--;
//                                   }
//                                 });
//                               },
//                             ),
//                             SizedBox(width: 10),
//                             Text(
//                               "${products[index].quantity}",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w700),
//                             ),
//                             SizedBox(width: 10),
//                             IconButton(
//                               icon: Icon(CupertinoIcons.plus,
//                                   color: Color(0xFFDB3022)),
//                               onPressed: () {
//                                 setState(() {
//                                   products[index].quantity++;
//                                 });
//                               },
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Select All",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   Checkbox(
//                     value: products.every((product) => product.selected),
//                     onChanged: (val) {
//                       setState(() {
//                         for (var product in products) {
//                           product.selected = val!;
//                         }
//                       });
//                     },
//                     splashRadius: 20,
//                     activeColor: Color(0xFFDB3022),
//                   ),
//                 ],
//               ),
//               Divider(
//                 height: 20,
//                 thickness: 1,
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Total Payment",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//                   Text(
//                     "\$${getTotalPayment().toStringAsFixed(2)}",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFFDB3022)),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context).pushNamed(Routes.order_sumary);
//                 },
//                 child: ContainerButtonModel(
//                   itext: "Check Out",
//                   containerWidth: MediaQuery.of(context).size.width,
//                   bgColor: Color(0xFFDB3022),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// !!!!!!!!!!!!!!!!!!

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/components/container_button_model.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class Product {
  final String image;
  final String title;
  final String price;
  final String description;
  int quantity;
  bool selected;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.description = "aaaaaaaa",
    this.quantity = 1,
    this.selected = false,
  });
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products = [
    Product(
        image: "assets/images/_project/Products/food_1.jpg",
        title: "Soft-Sided Pet Travel Carrier for Dogs",
        price: "\$29.99"),
    Product(
        image: "assets/images/_project/Products/food_2.jpg",
        title: "Rectangle Dog Bed",
        price: "\$12.00"),
    Product(
        image: "assets/images/_project/Products/food_3.jpg",
        title: "Dog Chew Toy",
        price: "\$5.06"),
    Product(
        image: "assets/images/_project/Products/food_4.jpg",
        title: "Another Dog Chew Toy",
        price: "\$5.06"),
  ];

  double getTotalPayment() {
    double total = 0;
    for (var product in products) {
      if (product.selected) {
        total += product.quantity * double.parse(product.price.substring(1));
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Slidable(
                  key: ValueKey(products[index].title),
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            products.removeAt(index);
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        products[index].selected = !products[index].selected;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          // BoxShadow(
                          //   color: Colors.grey.withOpacity(0.2),
                          //   spreadRadius: 2,
                          //   blurRadius: 5,
                          // ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: products[index].selected,
                            onChanged: (val) {
                              setState(() {
                                products[index].selected = val!;
                              });
                            },
                            splashRadius: 20,
                            activeColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              products[index].image,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index].title,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    products[index].description ??
                                        "bbbbbbbbbbb",
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "\$${(products[index].quantity * double.parse(products[index].price.substring(1))).toStringAsFixed(2)}",
                                    style: TextStyle(
                                        color: Color(0xFFDB3022),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(CupertinoIcons.minus,
                                    color: Colors.green),
                                onPressed: () {
                                  setState(() {
                                    if (products[index].quantity > 1) {
                                      products[index].quantity--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                "${products[index].quantity}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              IconButton(
                                icon: Icon(CupertinoIcons.plus,
                                    color: Color(0xFFDB3022)),
                                onPressed: () {
                                  setState(() {
                                    products[index].quantity++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select All",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Checkbox(
                      value: products.every((product) => product.selected),
                      onChanged: (val) {
                        setState(() {
                          for (var product in products) {
                            product.selected = val!;
                          }
                        });
                      },
                      splashRadius: 20,
                      activeColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    Text(
                      "\$${getTotalPayment().toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFDB3022)),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.order_sumary);
                  },
                  child: ContainerButtonModel(
                    itext: "Check Out",
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: Color(0xFFDB3022),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('3 items'),
                Text('\$46.99'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping'),
                Text('\$5.00'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '\$51.99',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
