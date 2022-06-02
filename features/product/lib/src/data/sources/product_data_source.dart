import 'package:product/product.dart';
import 'package:product/src/domain/entities/category.dart';

abstract class ProductDataSource {
  Future<List<Category>> getCategoryList();

  Future<List<Product>> getProductList({
    required int page,
    required int limit,
    required String categoryId,
    required String searchText,
  });
}
