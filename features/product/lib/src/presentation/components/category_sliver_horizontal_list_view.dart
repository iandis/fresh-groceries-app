import 'package:flutter/material.dart';
import 'package:product/src/presentation/components/category_horizontal_list_view.dart';
import 'package:shared_resources/shared_resources.dart';

class CategorySliverHorizontalListView extends SliverPersistentHeaderDelegate {
  const CategorySliverHorizontalListView();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: ThemeColors.white,
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 12.0,
      ),
      child: const CategoryHorizontalListView(),
    );
  }

  @override
  double get maxExtent => 94.0;

  @override
  double get minExtent => 94.0;

  @override
  bool shouldRebuild(CategorySliverHorizontalListView oldDelegate) {
    return false;
  }
}
