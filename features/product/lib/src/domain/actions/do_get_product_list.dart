import 'dart:async';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';
import 'package:product/product.dart';
import 'package:product/src/data/sources/product_data_source.dart';
import 'package:product/src/domain/inputs/get_product_list_input.dart';

@lazySingleton
class DoGetProductList extends Action<GetProductListInput, List<Product>> {
  const DoGetProductList(this._productDataSource);

  final ProductDataSource _productDataSource;

  @override
  Future<List<Product>> call(GetProductListInput input) {
    return _productDataSource.getProductList(
      page: input.page,
      limit: input.limit,
      categoryId: input.categoryId,
      searchText: input.searchText,
    );
  }
}
