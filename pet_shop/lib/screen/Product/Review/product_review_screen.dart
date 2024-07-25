import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/review.dart';
import 'package:pet_shop/screen/Product/Review/component/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  final List<Review> reviewList;

  const ProductReviewScreen({Key? key, required this.reviewList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Obx(() {
          if (ProductController.instance.reviewList.isNotEmpty) {
            return Review_Product(
                reviewList: ProductController.instance.reviewList,
                length: reviewList.length);
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

class Review_Product extends StatelessWidget {
  final List<Review> reviewList;
  final int length;
  const Review_Product({
    super.key,
    required this.reviewList,
    this.length = 5,
  });

  @override
  Widget build(BuildContext context) {
    double averageRating = 0;
    if (reviewList.isNotEmpty) {
      double totalRating =
          reviewList.map((review) => review.rating).reduce((a, b) => a + b);
      averageRating = totalRating / reviewList.length;
    }

    // Count ratings
    Map<int, int> ratingCounts = {
      5: 0,
      4: 0,
      3: 0,
      2: 0,
      1: 0,
    };
    reviewList.forEach((review) {
      int starRating = review.rating.round();
      if (ratingCounts.containsKey(starRating)) {
        ratingCounts[starRating] = ratingCounts[starRating]! + 1;
      }
    });

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Đánh Giá".toUpperCase(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      averageRating.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    RatingBarIndicator(
                      rating: averageRating,
                      itemSize: 20,
                      unratedColor: Colors.grey,
                      itemBuilder: (_, __) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: AlignmentDirectional.center,
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text('${reviewList.length}\ đánh giá',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      for (var i = 5; i >= 1; i--)
                        ProgressIndicator(
                          value: ratingCounts[i]! / reviewList.length,
                          text: '$i',
                        ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(
              height: 32.0,
            ),

            //todo [Review List]
            Column(
              children: [
                Column(children: [
                  Column(
                    children: reviewList
                        .take(length)
                        .map((review) => UserReviewCard(item: review))
                        .toList(),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (_) =>
                                ReviewListDialog(review_List: reviewList),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Xem Thêm",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.blue,
                            )
                          ],
                        )),
                  ])
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  final String text;
  final double value;
  const ProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '${text}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(primaryColorOrange),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}

class ReviewListDialog extends StatefulWidget {
  final List<Review> review_List;
  const ReviewListDialog({
    super.key,
    required this.review_List,
  });

  @override
  State<ReviewListDialog> createState() => _ReviewListDialogState();
}

class _ReviewListDialogState extends State<ReviewListDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reviews"),
        leading: BackButton(),
        backgroundColor: CustomAppColor.primaryColorOrange,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                children: widget.review_List
                    .map((review) => UserReviewCard(item: review))
                    .toList())),
      ),
    ));
  }
}
