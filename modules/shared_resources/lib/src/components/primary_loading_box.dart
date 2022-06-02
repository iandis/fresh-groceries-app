import 'package:flutter/material.dart';
import 'package:shared_resources/shared_resources.dart';

class PrimaryLoadingBox extends StatelessWidget {
  const PrimaryLoadingBox({
    Key? key,
    required this.height,
    required this.width,
    this.borderRadius = kDefaultBorderRadius,
    this.color = ThemeColors.greyLight,
  }) : super(key: key);

  final double height;

  final double width;

  final BorderRadius borderRadius;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
    );
  }
}
