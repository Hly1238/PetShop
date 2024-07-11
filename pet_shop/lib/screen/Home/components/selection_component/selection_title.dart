import 'package:flutter/material.dart';

class SelectionTitle extends StatelessWidget {
  final String title;
  const SelectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          InkWell(
            child: Text(
              "Xem thêm",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
