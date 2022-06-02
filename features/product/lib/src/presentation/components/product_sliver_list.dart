import 'package:flutter/material.dart';
import 'package:product/src/domain/entities/product.dart';
import 'package:product/src/presentation/components/product_list_tile.dart';
import 'package:product/src/presentation/components/product_list_tile_loading.dart';

class ProductSliverList extends StatelessWidget {
  const ProductSliverList({
    Key? key,
    required this.shouldShowLoadingList,
    required this.productList,
    required this.onBuyPressed,
  }) : super(key: key);

  final bool shouldShowLoadingList;
  final List<Product> productList;
  final void Function(Product product) onBuyPressed;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: shouldShowLoadingList
                ? const ProductListTileLoading()
                : ProductListTile(
                    product: productList[index],
                    onBuyPressed: onBuyPressed,
                  ),
          );
        },
        childCount: shouldShowLoadingList ? 8 : productList.length,
      ),
    );
  }
}
