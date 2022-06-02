import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/src/domain/entities/category.dart';
import 'package:product/src/presentation/blocs/category_list/category_list_bloc.dart';
import 'package:product/src/presentation/components/category_item.dart';

class CategoryHorizontalListView extends StatelessWidget {
  const CategoryHorizontalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 38.0,
          child: BlocBuilder<CategoryListBloc, CategoryListState>(
            builder: (BuildContext context, CategoryListState state) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.categoryList.length,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                itemBuilder: (BuildContext context, int index) {
                  final Category category = state.categoryList[index];
                  return CategoryItem(
                    isSelected: index == state.selectedIndex,
                    category: category,
                    onPressed: () => _onCategoryPressed(context, index),
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 12.0);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _onCategoryPressed(BuildContext context, int index) {
    context.read<CategoryListBloc>().add(CategoryListSelectEvent(index));
  }
}
