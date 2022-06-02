import 'package:flutter/material.dart';
import 'package:product/src/presentation/components/product_list_view.dart';
import 'package:shared_resources/shared_resources.dart';

class ProductHomeView extends StatelessWidget {
  const ProductHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Find ',
                style: TextStyle(
                  color: ThemeColors.secondary,
                  fontSize: 18.0,
                ),
              ),
              TextSpan(
                text: 'Fresh Groceries ',
                style: TextStyle(
                  color: ThemeColors.primary,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const ProductListView(),
    );
  }
}
