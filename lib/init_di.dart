import 'package:get_it/get_it.dart';
import 'package:home/home.dart';
import 'package:product/product.dart';

void initDI(GetIt getIt) {
  initProductFeature(getIt);
  initHomeFeature(getIt);
}
