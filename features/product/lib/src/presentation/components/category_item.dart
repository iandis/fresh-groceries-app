import 'package:flutter/material.dart';
import 'package:product/src/domain/entities/category.dart';
import 'package:shared_resources/shared_resources.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.isSelected,
    required this.category,
    required this.onPressed,
  }) : super(key: key);

  final bool isSelected;

  final Category category;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 38.0,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
          borderRadius: kDefaultBorderRadius,
          color: isSelected ? ThemeColors.primary : ThemeColors.greyLight,
        ),
        child: Text(
          category.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isSelected ? ThemeColors.white : ThemeColors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }
}
