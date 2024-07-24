import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_shop/models/Product/review.dart';

class UserReviewCard extends StatelessWidget {
  final Review item;
  const UserReviewCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/_project/Logo/logo.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  item.username,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),

        //Review
        Row(
          children: [
            RatingBarIndicator(
              rating: item.rating,
              itemSize: 20,
              unratedColor: Colors.grey,
              itemBuilder: (_, __) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                '${item.createdAt}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text('${item.comment}'),
        SizedBox(
          height: 32,
        ),
        // Container(
        //   child: Padding(
        //     padding: EdgeInsets.all(16),
        //     child: Column(
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "T's Store",
        //               style: Theme.of(context).textTheme.titleMedium,
        //             ),
        //             Text(
        //               "02 Nov 2023",
        //               style: Theme.of(context).textTheme.titleMedium,
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: 16,
        //         ),
        //         Text(
        //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultricies, odio id scelerisque ultricies, ligula urna scelerisque purus, sit amet pharetra leo augue eget mauris. Phasellus commodo laoreet laoreet. Aenean ullamcorper metus ac lobortis tempus. Aliquam nec arcu ut tellus euismod maximus eget vel turpis. Nullam risus lacus, imperdiet placerat aliquam ut, efficitur ac velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. ")
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
