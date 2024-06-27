import 'package:flutter/material.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/screen/Product/components/rounded_container.dart';
import 'package:pet_shop/screen/Product/components/rounded_img.dart';
import 'package:pet_shop/screen/Product/style/shadows_style.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 780, // Kích thước mong muốn của bạn
          ),
          child: Container(
            width: 240,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                boxShadow: [TShadowStyle.verticalProductShadow],
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white
                // color: ThemeMode.dark
                //     ? TColors.darkerGrey
                //     : TColors.white,
                ),
            child: Column(
              children: [
                //TODO: Image product
                RoundedContainer(
                  height: 280,
                  // padding: const EdgeInsets.all(10.0),
                  backgroundColor: Colors.pink,
                  child: Stack(
                    children: [
                      RoundedImg(
                        imageUrl:
                            "assets/images/_project/Account/black_dog.png",
                        applyImageRadius: true,
                      ),
                      //TODO: RatingStar
                      Positioned(
                        top: 12,
                        child: RoundedContainer(
                          radius: 10,
                          backgroundColor: Colors.amber.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Text(
                            '25%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: Colors.black),
                          ),
                        ),
                      ),

                      //TODO: Sale Tag
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: RoundedContainer(
                          radius: 10,
                          backgroundColor: Colors.purple.withOpacity(1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Text(
                            '35% Discount',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: Colors.black),
                          ),
                        ),
                      ),

                      //TODO: Fav Icon
                      // Positioned(
                      //   top: 0,
                      //   right: 0,
                      //   child: Container(
                      //     // color: primaryColorOrange,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(100),
                      //       // color: primaryColorOrange,
                      //     ),
                      //     child: IconButton(
                      //       onPressed: () {},
                      //       // icon: Icon(Icons.favorite_border),
                      //       icon: Icon(Icons.favorite),
                      //       color: Colors.red,
                      //       iconSize: 30,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                //TODO: Details
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Green Nike Air Shoes Lorem Ispum Loren Black Host Starter',
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Nike',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.verified,
                            color: Colors.amber,
                            size: 20,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$35.5',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Container(
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
                          )
                        ],
                      ),
                    ],
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
