import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardLoading extends StatelessWidget {
  const ProductCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey.shade300,
          child: Container(
            margin: EdgeInsets.all(10),
            width: 120,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 0.9,
                  child: Container(
                    color: Colors.grey,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Container(
                    height: 15,
                    color: Colors.grey,
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
