import 'package:ecommerce/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEx extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerEx.bottomrightcorner({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(35))),
  });

  // ignore: use_key_in_widget_constructors
  const ShimmerEx.circular(
      {required this.height,
      this.width = double.infinity,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: gery.withOpacity(0.40),
        highlightColor: colorAccent.withOpacity(0.40),
        period: const Duration(seconds: 1),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(5),
          height: height,
          width: width,
          decoration:
              ShapeDecoration(shape: shapeBorder, color: Colors.grey[5000]!),
        ),
      );
}
