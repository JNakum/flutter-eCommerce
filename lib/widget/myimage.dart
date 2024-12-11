import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyImage extends StatelessWidget {
  double? height, width;
  String imagePath;
  Color? color;
  var fit;
  final double radius;

  MyImage(
      {super.key,
      this.height,
      this.width,
      required this.imagePath,
      this.color,
      this.fit,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      child: Image.asset(
        "assets/images/$imagePath",
        height: height,
        color: color,
        width: width,
        fit: fit,
      ),
    );
  }
}
