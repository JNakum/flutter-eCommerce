import 'package:flutter/material.dart';

class MySize extends StatelessWidget {
  final double? height;
  final double? width;

  const MySize({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
