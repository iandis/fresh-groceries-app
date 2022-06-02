import 'package:flutter/material.dart';
import 'package:shared_resources/shared_resources.dart';

class ProductImagePlaceholder extends StatelessWidget {
  const ProductImagePlaceholder({
    Key? key,
    this.height,
    this.width,
    this.color = ThemeColors.greyLight,
    this.borderRadius = kDefaultBorderRadius,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: const Icon(
        Icons.local_mall,
        color: ThemeColors.grey,
        size: 30,
      ),
    );
  }
}
