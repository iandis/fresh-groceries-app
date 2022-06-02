import 'package:flutter/material.dart';
import 'package:shared_resources/shared_resources.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({
    Key? key,
    this.text,
    required this.onChanged,
  }) : super(key: key);

  final String? text;

  final ValueChanged<String> onChanged;

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar>
    with AutoDisposeStateMixin<ProductSearchBar> {
  late final TextEditingController _textEditingController = autoDispose(
    TextEditingController(text: widget.text),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: widget.onChanged,
      decoration: const InputDecoration(
        hintText: 'Search Groceries',
        hintStyle: TextStyle(
          color: ThemeColors.grey,
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
        ),
        contentPadding: EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColors.greyLight,
          ),
          borderRadius: kDefaultBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColors.greyLight,
          ),
          borderRadius: kDefaultBorderRadius,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: ThemeColors.primary,
        ),
      ),
    );
  }
}
