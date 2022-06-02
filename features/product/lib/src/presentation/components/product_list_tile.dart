import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product/src/domain/entities/product.dart';
import 'package:product/src/presentation/components/product_image_placeholder.dart';
import 'package:shared_resources/shared_resources.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
    required this.onBuyPressed,
  }) : super(key: key);

  final Product product;
  final void Function(Product product) onBuyPressed;

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
              borderRadius: kDefaultBorderRadius,
            ),
            clipBehavior: Clip.hardEdge,
            child: product.imageUrl.isEmpty
                ? const ProductImagePlaceholder()
                : CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) {
                      return const ProductImagePlaceholder();
                    },
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ThemeColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  product.pricePerUnitInIDR,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ThemeColors.greyDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  ),
                ),
                RatingStars(rating: product.averageRating),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              child: const Text('Buy'),
              onPressed: () => onBuyPressed(product),
            ),
          ),
        ],
      ),
    );
  }
}
