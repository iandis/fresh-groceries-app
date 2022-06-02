import 'dart:async';
import 'dart:math';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';
import 'package:product/src/data/sources/product_data_source.dart';
import 'package:product/src/domain/entities/category.dart';
import 'package:product/src/domain/entities/product.dart';

final Random _random = Random();

@mock
@LazySingleton(as: ProductDataSource)
class ProductMockDataSource implements ProductDataSource {
  static final Map<String, List<Product>> _productListGroup =
      <String, List<Product>>{
    '1': List<Product>.generate(
      30,
      (int index) {
        return Product(
          id: 'apple$index',
          name: 'Sweet Apple No. ${index + 1}',
          imageUrl: '',
          price: 5000 + 50 * index,
          unit: 'kg',
          averageRating: _random.nextDouble() * 5.0,
        );
      },
    ),
    '2': List<Product>.generate(
      30,
      (int index) {
        return Product(
          id: 'orange$index',
          name: 'Sour Orange No. ${index + 1}',
          imageUrl: '',
          price: 10000 + 100 * index,
          unit: 'gr',
          averageRating: _random.nextDouble() * 5.0,
        );
      },
    ),
    '3': List<Product>.generate(
      30,
      (int index) {
        return Product(
          id: 'banana$index',
          name: 'Red Banana No. ${index + 1}',
          imageUrl: '',
          price: 30000 + 500 * index,
          unit: 'pcs',
          averageRating: _random.nextDouble() * 5.0,
        );
      },
    ),
    '4': List<Product>.generate(
      30,
      (int index) {
        return Product(
          id: 'mango$index',
          name: 'Oversweet Mango No. ${index + 1}',
          imageUrl: '',
          price: 25000 + 500 * index,
          unit: 'kg',
          averageRating: _random.nextDouble() * 5.0,
        );
      },
    ),
  };

  static const List<Category> _categoryList = <Category>[
    Category(id: '1', name: 'Apple'),
    Category(id: '2', name: 'Orange'),
    Category(id: '3', name: 'Banana'),
    Category(id: '4', name: 'Mango'),
  ];

  static Future<T> _randomDelay<T>(FutureOr<T> Function() fn) {
    final Duration randomDuration = Duration(
      milliseconds: max(
        500,
        _random.nextInt(2100),
      ),
    );

    return Future<T>.delayed(randomDuration, fn);
  }

  @override
  Future<List<Category>> getCategoryList() {
    return _randomDelay(() => _categoryList);
  }

  @override
  Future<List<Product>> getProductList({
    required int page,
    required int limit,
    required String categoryId,
    required String searchText,
  }) {
    final List<Product>? productListAll = _productListGroup[categoryId];
    final List<Product> result;

    if (productListAll == null) {
      result = const <Product>[];
    } else {
      final int indexEnd = min(
        productListAll.length,
        (page + 1) * limit,
      );

      result = <Product>[];

      for (int index = page * limit; index < indexEnd; index++) {
        final Product current = productListAll[index];
        if (searchText.isNotEmpty) {
          if (current.name.toLowerCase().contains(searchText.toLowerCase())) {
            result.add(current);
          }
        } else {
          result.add(current);
        }
      }
    }

    return _randomDelay(() => result);
  }
}
