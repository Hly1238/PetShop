import 'package:flutter/material.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/screen/Product/components/product_card_vertical.dart';

class ProductShowingGrid extends StatelessWidget {
  final List<Product> productList;
  const ProductShowingGrid({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200,
      ),
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10),
      itemCount: productList.length,
      itemBuilder: (context, index) =>
          ProductCardVertical(product: productList[index]),
    );
  }
}
