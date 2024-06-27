import 'package:flutter/material.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/screen/Product/components/product_card_vertical.dart';
import 'package:pet_shop/screen/Product/detail_product.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabs = ["All", "Category", "Top", "Recommended"];
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
  List reviews = ["54", "120", "542", "34"];
  List prices = ["\$300", "\$300", "\$300", "\$300"];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var crossAxisCount = (screenWidth / 300).floor();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: CustomAppColor.lightBackgroundColor_Home,
      // body: SingleChildScrollView(
      //   child: SafeArea(
      //     child: Padding(
      //       padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             decoration: BoxDecoration(
      //               color: Color(0xFFFFF0DD),
      //               borderRadius: BorderRadius.circular(20),
      //               boxShadow: [
      //                 BoxShadow(
      //                     color: Colors.black12,
      //                     blurRadius: 1,
      //                     spreadRadius: 2),
      //               ],
      //             ),
      //             child: FractionallySizedBox(
      //               child: Image(
      //                 image: AssetImage(
      //                     "assets/images/_project/Home/Banners/banner.jpg"),
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           SizedBox(
      //             height: 50,
      //             child: ListView.builder(
      //               shrinkWrap: true,
      //               scrollDirection: Axis.horizontal,
      //               itemCount: tabs.length,
      //               itemBuilder: (context, index) {
      //                 return FittedBox(
      //                   child: Container(
      //                     height: 40,
      //                     margin: EdgeInsets.all(8),
      //                     padding: EdgeInsets.only(left: 15, right: 15),
      //                     decoration: BoxDecoration(
      //                         color: Colors.black12.withOpacity(0.05),
      //                         borderRadius: BorderRadius.circular(20)),
      //                     child: Center(
      //                       child: FittedBox(
      //                         child: Text(tabs[index],
      //                             style: TextStyle(
      //                               color: Colors.black38,
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 16,
      //                             )),
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             height: 290,
      //             child: ListView.builder(
      //               itemCount: imageList.length,
      //               scrollDirection: Axis.horizontal,
      //               shrinkWrap: true,
      //               itemBuilder: (context, index) {
      //                 return Container(
      //                   margin: EdgeInsets.only(right: 15),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       SizedBox(
      //                         height: 180,
      //                         width: 150,
      //                         child: Stack(
      //                           children: [
      //                             InkWell(
      //                                 onTap: () {
      //                                   Navigator.push(
      //                                       context,
      //                                       MaterialPageRoute(
      //                                         builder: (context) =>
      //                                             DetailProduct(),
      //                                       ));
      //                                 },
      //                                 child: ClipRRect(
      //                                   borderRadius: BorderRadius.circular(15),
      //                                   child: Image(
      //                                     image: AssetImage(imageList[index]),
      //                                     fit: BoxFit.cover,
      //                                     height: 180,
      //                                     width: 150,
      //                                   ),
      //                                 )),
      //                             Positioned(
      //                               right: 10,
      //                               top: 10,
      //                               child: Container(
      //                                 height: 30,
      //                                 width: 30,
      //                                 decoration: BoxDecoration(
      //                                     color: Colors.white,
      //                                     borderRadius:
      //                                         BorderRadius.circular(20)),
      //                                 child: Center(
      //                                   child: Icon(
      //                                     Icons.favorite,
      //                                     color: Color(0xFFDB3022),
      //                                   ),
      //                                 ),
      //                               ),
      //                             )
      //                           ],
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: 10,
      //                       ),
      //                       Text(
      //                         productTitles[index],
      //                         style: TextStyle(
      //                             fontSize: 18, fontWeight: FontWeight.bold),
      //                       ),
      //                       SizedBox(
      //                         height: 10,
      //                       ),
      //                       Row(
      //                         children: [
      //                           Icon(
      //                             Icons.star,
      //                             color: Colors.amber,
      //                             size: 22,
      //                           ),
      //                           Text(reviews[index]),
      //                           SizedBox(
      //                             width: 10,
      //                           ),
      //                           Text(
      //                             prices[index],
      //                             style: TextStyle(
      //                                 fontSize: 18,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Color(0xFFDB3022)),
      //                           ),
      //                         ],
      //                       )
      //                     ],
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Align(
      //             alignment: Alignment.centerLeft,
      //             child: Text(
      //               "Newest Products",
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 30,
      //           ),
      //           GridView.builder(
      //             itemCount: productTitles.length,
      //             shrinkWrap: true,
      //             physics: NeverScrollableScrollPhysics(),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               childAspectRatio: 0.7,
      //               // crossAxisSpacing: 30
      //             ),
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 width: 200,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     SizedBox(
      //                       height: 250,
      //                       child: Stack(
      //                         children: [
      //                           InkWell(
      //                               onTap: () {
      //                                 Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(
      //                                       builder: (context) =>
      //                                           DetailProduct(),
      //                                     ));
      //                               },
      //                               child: ClipRRect(
      //                                 borderRadius: BorderRadius.circular(15),
      //                                 child: Image(
      //                                   image: AssetImage(imageList[index]),
      //                                   fit: BoxFit.cover,
      //                                   width: 180,
      //                                   height: 250,
      //                                 ),
      //                               )),
      //                           Positioned(
      //                             right: 10,
      //                             top: 10,
      //                             child: Container(
      //                               height: 30,
      //                               width: 30,
      //                               decoration: BoxDecoration(
      //                                   color: Colors.white,
      //                                   borderRadius:
      //                                       BorderRadius.circular(20)),
      //                               child: Center(
      //                                 child: Icon(
      //                                   Icons.favorite,
      //                                   color: Color(0xFFDB3022),
      //                                 ),
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 10,
      //                     ),
      //                     Text(
      //                       productTitles[index],
      //                       style: TextStyle(
      //                           fontSize: 18, fontWeight: FontWeight.bold),
      //                     ),
      //                     SizedBox(
      //                       height: 10,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Icon(
      //                           Icons.star,
      //                           color: Colors.amber,
      //                           size: 22,
      //                         ),
      //                         Text(reviews[index]),
      //                         SizedBox(
      //                           width: 10,
      //                         ),
      //                         Text(
      //                           prices[index],
      //                           style: TextStyle(
      //                               fontSize: 18,
      //                               fontWeight: FontWeight.bold,
      //                               color: Color(0xFFDB3022)),
      //                         ),
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //               );
      //             },
      //           ),
      //           Padding(
      //             padding: EdgeInsets.zero,
      //             child: Column(
      //               children: [
      //                 GridView.builder(
      //                   itemCount: 8,
      //                   shrinkWrap: true,
      //                   physics: NeverScrollableScrollPhysics(),
      //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                     crossAxisCount: crossAxisCount,
      //                     mainAxisSpacing: 20,
      //                     crossAxisSpacing: 20,
      //                     mainAxisExtent: 430,
      //                   ),
      //                   itemBuilder: (_, index) => ProductCardVertical(),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  //TODO: [Main Header]
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      elevation: 0,
      leadingWidth: 110, // Điều chỉnh chiều rộng để hình ảnh hiển thị đầy đủ
      leading: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Container(
          child: Image(
            image: AssetImage("assets/images/_project/Logo/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
          child: Image(
            image: AssetImage(
              "assets/images/_project/Icons/loupe.png",
            ),
            width: 30,
          ),
        ),
        SizedBox(
          width: kDefaultPaddin,
        ),
        badges.Badge(
          badgeContent: Text(
            '3',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          badgeStyle: badges.BadgeStyle(
            badgeColor: kPrimaryColor,
            padding: EdgeInsets.all(7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {},
            child: Image(
              image: AssetImage(
                "assets/images/_project/Icons/shopping-bag-blue.png",
              ),
              width: 35,
              height: 35,
            ),
          ),
        ),
        // Stack(
        //   children: <Widget>[
        //     IconButton(
        //       icon: Icon(
        //         Icons.shopping_bag_outlined,
        //         color: kTextColor,
        //         size: 32,
        //       ),
        //       onPressed: () {},
        //     ),
        //     Positioned(
        //       right: 8,
        //       top: 8,
        //       child: Container(
        //         padding: EdgeInsets.all(2),
        //         decoration: BoxDecoration(
        //           color: Colors.red,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         constraints: BoxConstraints(
        //           minWidth: 16,
        //           minHeight: 16,
        //         ),
        //         child: Text(
        //           '5', // Đây là số bạn muốn hiển thị
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 10,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}

//TODO: Search
class CustomSearchDelegate extends SearchDelegate<String> {
  //TODO: Search
  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Strawbery',
    'Blueberry',
    'Cherry',
    'Pinapple',
    'Watermelon'
  ];

  List<String> searchAndFilter(String query) {
    if (query == '') return [];
    return items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final results = searchAndFilter(query);
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          title: Text(item),
          onTap: () {
            query = item;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final results = searchAndFilter(query);
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final item = results[index];
          return ListTile(
            title: Text(item),
            onTap: () {
              // Navigator.of(context).push(
              //   builder: (_) => DetailProduct(
              //     fruitName: item,
              //   ),
              // );
              // showSearch(context: context, delegate: CustomSearchDelegate());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Trying to Login"),
                ),
              );
            },
          );
        });
  }
}
