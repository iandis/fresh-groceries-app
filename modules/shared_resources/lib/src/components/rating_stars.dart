import 'package:flutter/material.dart';
import 'package:shared_resources/shared_resources.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key? key,
    required this.rating,
    this.starSize = 24.0,
    this.starColor = ThemeColors.secondary,
  })  : assert(rating >= 0.0 && rating <= _maxStars),
        super(key: key);

  static const int _maxStars = 5;

  final double rating;

  final double starSize;

  final Color starColor;

  @override
  Widget build(BuildContext context) {
    int halfStar = ((rating * 2) % 2).toInt();
    int fullStars = (rating - (halfStar * 0.5)).toInt();
    int emptyStars = _maxStars - fullStars - halfStar;

    final List<Widget> stars = <Widget>[];

    while (fullStars > 0) {
      stars.add(
        Icon(
          Icons.star,
          color: starColor,
          size: starSize,
        ),
      );
      fullStars--;
    }

    while (halfStar > 0) {
      stars.add(
        Icon(
          Icons.star_half,
          color: starColor,
          size: starSize,
        ),
      );
      halfStar--;
    }

    while (emptyStars > 0) {
      stars.add(
        Icon(
          Icons.star_border_outlined,
          color: starColor,
          size: starSize,
        ),
      );
      emptyStars--;
    }

    return Row(children: stars);
  }
}
