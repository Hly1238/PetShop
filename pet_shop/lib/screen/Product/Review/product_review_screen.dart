import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/screen/Product/Review/component/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({Key? key}) : super(key: key);

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
      body: Review_Product(),
    );
  }
}

class Review_Product extends StatelessWidget {
  const Review_Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultricies, odio id scelerisque ultricies, ligula urna scelerisque purus, sit amet pharetra leo augue eget mauris. Phasellus commodo laoreet laoreet. Aenean ullamcorper metus ac lobortis tempus. Aliquam nec arcu ut tellus euismod maximus eget vel turpis. Nullam risus lacus, imperdiet placerat aliquam ut, efficitur ac velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. "),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    '4.8',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      ProgressIndicator(
                        value: 1,
                        text: '5',
                      ),
                      ProgressIndicator(
                        value: 0.8,
                        text: '4',
                      ),
                      ProgressIndicator(
                        value: 0.6,
                        text: '3',
                      ),
                      ProgressIndicator(
                        value: 0.4,
                        text: '2',
                      ),
                      ProgressIndicator(
                        value: 0.2,
                        text: '1',
                      ),
                    ],
                  ),
                )
              ],
            ),
            RatingBarIndicator(
              rating: 3.5,
              itemSize: 20,
              unratedColor: Colors.grey,
              itemBuilder: (_, __) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
            Text("12,611", style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              height: 32.0,
            ),

            //todo [Review List]
            UserReviewCard(),
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
