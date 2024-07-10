import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

class BannerCart extends StatelessWidget {
  final String id;
  final String imageUrl;

  const BannerCart({Key? key, required this.id, required this.imageUrl})
      : super(key: key);

  void _showToast(BuildContext context, String id) {
    Fluttertoast.showToast(
      msg: "Banner ID: $id",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showToast(context, id),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.red,
              child: const Icon(Icons.error, color: Colors.white),
            ),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
