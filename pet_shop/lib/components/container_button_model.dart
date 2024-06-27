import 'package:flutter/material.dart';

class ContainerButtonModel extends StatelessWidget {
  // const ContainerButtonModel({Key? key}) : super(key: key);
  final Color? bgColor;
  final double? containerWidth;
  final String itext;

  const ContainerButtonModel(
      {super.key, this.bgColor, this.containerWidth, required this.itext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: bgColor),
      child: Center(
        child: Text(
          itext,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
