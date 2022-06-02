import 'package:flutter/material.dart';
import 'package:shared_resources/shared_resources.dart';

class ProductListTileLoading extends StatelessWidget {
  const ProductListTileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: ThemeColors.greyLight),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 86,
            width: 86,
            decoration: const BoxDecoration(
              color: ThemeColors.greyLight,
              borderRadius: kDefaultBorderRadius,
            ),
            clipBehavior: Clip.hardEdge,
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              PrimaryLoadingBox(
                height: 13,
                width: 70,
              ),
              PrimaryLoadingBox(
                height: 15,
                width: 50,
              ),
              RatingStars(
                rating: 5.0,
                starColor: ThemeColors.greyLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
