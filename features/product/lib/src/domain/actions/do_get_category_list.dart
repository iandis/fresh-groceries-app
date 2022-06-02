import 'dart:async';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';
import 'package:product/src/data/sources/product_data_source.dart';
import 'package:product/src/domain/entities/category.dart';

@lazySingleton
class DoGetCategoryList extends NoInputAction<List<Category>> {
  const DoGetCategoryList(this._productDataSource);

  final ProductDataSource _productDataSource;

  @override
  Future<List<Category>> call([void input]) {
    return _productDataSource.getCategoryList();
  }
}
