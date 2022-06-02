import 'dart:async';

import 'package:base/base.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:product/src/presentation/blocs/category_list/category_list_bloc.dart';

@lazySingleton
class DoListenCategoryListState extends Action<ValueChanged<CategoryListState>,
    StreamSubscription<CategoryListState>> {
  const DoListenCategoryListState(this._categoryListBloc);

  final CategoryListBloc _categoryListBloc;

  @override
  StreamSubscription<CategoryListState> call(
    ValueChanged<CategoryListState> input,
  ) {
    return _categoryListBloc.stream.listen(input);
  }
}
