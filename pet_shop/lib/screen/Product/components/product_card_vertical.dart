// import 'package:flutter/material.dart';
// import 'package:pet_shop/models/Product/product.dart';
// import 'package:pet_shop/screen/Product/components/rounded_container.dart';
// import 'package:pet_shop/screen/Product/components/rounded_img.dart';
// import 'package:pet_shop/screen/Product/style/shadows_style.dart';

// class ProductCardVertical extends StatelessWidget {
//   final Product product;
//   const ProductCardVertical({Key? key, required this.product})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // if (product.images.isNotEmpty && product.images[0] != null) {
//     //   print('Product Image URL: ${product.images[0]}');
//     // }
//     return GestureDetector(
//       onTap: () {},
//       child: Center(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxWidth: 200,
//           ),
//           child: Container(
//             margin: EdgeInsets.only(right: 10),
//             width: 200,
//             padding: const EdgeInsets.all(1),
//             decoration: BoxDecoration(
//                 boxShadow: [TShadowStyle.verticalProductShadow],
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: Colors.white
//                 // color: ThemeMode.dark
//                 //     ? TColors.darkerGrey
//                 //     : TColors.white,
//                 ),
//             child: Column(
//               children: [
//                 //TODO: Images Product
//                 Flexible(
//                   flex: 4,
//                   child: Center(
//                     child: Container(
//                       // height: 220,
//                       child: Stack(
//                         children: [
//                           //todo [Images Product]
//                           Positioned.fill(
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(16.0),
//                                   topRight: Radius.circular(16.0)),
//                               child: product.images.isNotEmpty &&
//                                       product.images[0] != null
//                                   ? Image.network(
//                                       product.images[0],
//                                       fit: BoxFit.cover,
//                                     )
//                                   : Image.asset(
//                                       "assets/images/_project/Account/black_dog.png",
//                                       fit: BoxFit.cover,
//                                     ),
//                             ),
//                           ),
//                           //todo [Sale Tag]
//                           if (product.discount != null)
//                             Positioned(
//                               bottom: 0,
//                               right: 0,
//                               child: RoundedContainer(
//                                 radius: 10,
//                                 backgroundColor: Colors.purple.withOpacity(1),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8.0, vertical: 4),
//                                 child: Text(
//                                   // 'product.discount as String',
//                                   '${product.discount}% Discount',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelLarge!
//                                       .apply(color: Colors.black),
//                                 ),
//                               ),
//                             ),
//                           //todo [Rating tag]
//                           Positioned(
//                             top: 4,
//                             left: 0,
//                             child: RoundedContainer(
//                               radius: 10,
//                               backgroundColor: Colors.amber,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 8.0, vertical: 4),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.star, size: 16, color: Colors.red),
//                                   SizedBox(width: 4),
//                                   product.discount == 0
//                                       ? Text(
//                                           '5.0',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .labelLarge!
//                                               .apply(color: Colors.black),
//                                         )
//                                       : Text(
//                                           '${product.discount}% Discount',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .labelLarge!
//                                               .apply(color: Colors.black),
//                                         ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           //todo [Fav Icon]
//                           // Positioned(
//                           //   top: 0,
//                           //   right: 0,
//                           //   child: Container(
//                           //     decoration: BoxDecoration(
//                           //       borderRadius: BorderRadius.circular(100),
//                           //     ),
//                           //     child: IconButton(
//                           //       onPressed: () {},
//                           //       icon: Icon(Icons.favorite),
//                           //       color: Colors.red,
//                           //       iconSize: 30,
//                           //     ),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 //TODO: Details
//                 Flexible(
//                   flex: 3,
//                   child: Container(
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 10, top: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 10.0),
//                             child: Text(
//                               product.name,
//                               style: TextStyle(fontSize: 20),
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   product.category.name,
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 1,
//                                   style: Theme.of(context).textTheme.labelLarge,
//                                 ),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                                 Icon(
//                                   Icons.verified,
//                                   color: Colors.amber,
//                                   size: 20,
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '${product.price}',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style:
//                                     Theme.of(context).textTheme.headlineMedium,
//                               ),
//                               Container(
//                                 decoration: const BoxDecoration(
//                                   color: Colors.red,
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(12),
//                                     bottomRight: Radius.circular(20),
//                                   ),
//                                 ),
//                                 child: SizedBox(
//                                   width: 40,
//                                   height: 40,
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.add,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/Product/components/rounded_container.dart';

class ProductCardVertical extends StatelessWidget {
  final Product product;
  const ProductCardVertical({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.details, arguments: product);
      },
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 200,
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            width: 200,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0)),
                            child: product.image.isNotEmpty &&
                                    product.image[0] != null
                                ? Image.network(
                                    product.image[0],
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/_project/Account/black_dog.png",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        if (product.promotion != null)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: RoundedContainer(
                              radius: 10,
                              backgroundColor: Colors.purple.withOpacity(1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Text(
                                '${product.promotion}% Discount',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(color: Colors.black),
                              ),
                            ),
                          ),
                        Positioned(
                          top: 4,
                          left: 0,
                          child: RoundedContainer(
                            radius: 10,
                            backgroundColor: Colors.amber,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Row(
                              children: [
                                Icon(Icons.star, size: 16, color: Colors.red),
                                SizedBox(width: 4),
                                product.promotion == 0
                                    ? Text(
                                        '5.0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .apply(color: Colors.black),
                                      )
                                    : Text(
                                        '${product.promotion}% Discount',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .apply(color: Colors.black),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.category.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.verified,
                              color: Colors.amber,
                              size: 20,
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${product.price}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
