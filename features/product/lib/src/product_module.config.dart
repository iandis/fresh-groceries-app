// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/sources/product_data_source.dart' as _i3;
import 'data/sources/product_mock_data_source.dart' as _i4;
import 'domain/actions/do_get_category_list.dart' as _i5;
import 'domain/actions/do_get_product_list.dart' as _i6;
import 'domain/actions/do_listen_category_list_state.dart' as _i8;
import 'presentation/blocs/category_list/category_list_bloc.dart' as _i7;
import 'presentation/blocs/product_list/product_list_bloc.dart' as _i9;

const String _mock = 'mock';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ProductDataSource>(() => _i4.ProductMockDataSource(),
      registerFor: {_mock});
  gh.lazySingleton<_i5.DoGetCategoryList>(
      () => _i5.DoGetCategoryList(get<_i3.ProductDataSource>()));
  gh.lazySingleton<_i6.DoGetProductList>(
      () => _i6.DoGetProductList(get<_i3.ProductDataSource>()));
  gh.lazySingleton<_i7.CategoryListBloc>(
      () => _i7.CategoryListBloc(get<_i5.DoGetCategoryList>()));
  gh.lazySingleton<_i8.DoListenCategoryListState>(
      () => _i8.DoListenCategoryListState(get<_i7.CategoryListBloc>()));
  gh.lazySingleton<_i9.ProductListBloc>(() => _i9.ProductListBloc(
      get<_i6.DoGetProductList>(), get<_i8.DoListenCategoryListState>()));
  return get;
}
