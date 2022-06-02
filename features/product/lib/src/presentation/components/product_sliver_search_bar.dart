import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/product.dart';
import 'package:product/src/presentation/components/product_search_bar.dart';
import 'package:shared_resources/shared_resources.dart';

class ProductSliverSearchBar extends SliverPersistentHeaderDelegate {
  const ProductSliverSearchBar();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: ThemeColors.white,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ProductSearchBar(
        onChanged: (String value) {
          context
              .read<ProductListBloc>()
              .add(ProductListSearchEvent(searchText: value));
        },
      ),
    );
  }

  @override
  double get maxExtent => 72.0;

  @override
  double get minExtent => 72.0;

  @override
  bool shouldRebuild(ProductSliverSearchBar oldDelegate) {
    return false;
  }
}
