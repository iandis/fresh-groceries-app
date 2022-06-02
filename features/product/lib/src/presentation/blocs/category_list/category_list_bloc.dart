import 'dart:developer';

import 'package:base/base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:product/src/domain/actions/do_get_category_list.dart';
import 'package:product/src/domain/entities/category.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

@lazySingleton
class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc(this._doGetCategoryList)
      : super(const CategoryListState.init()) {
    on<CategoryListSelectEvent>(_onSelect);
    on<CategoryListLoadEvent>(_onLoad);
  }

  final DoGetCategoryList _doGetCategoryList;

  void _onSelect(
    CategoryListSelectEvent event,
    Emitter<CategoryListState> emit,
  ) {
    if (state.isLoading ||
        state.categoryList.isEmpty ||
        state.selectedIndex == event.selectedIndex) {
      return;
    }

    emit(
      state.copyWith(selectedIndex: event.selectedIndex),
    );
  }

  Future<void> _onLoad(
    CategoryListLoadEvent event,
    Emitter<CategoryListState> emit,
  ) async {
    if (state.isLoading) return;

    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      final List<Category> result = await _doGetCategoryList();
      emit(state.copyWith(
        isLoading: false,
        categoryList: result,
      ));
    } catch (error, stackTrace) {
      log(
        'An error caught while loading category list:\n$event',
        name: 'CategoryListBloc._onLoad',
        error: error,
        stackTrace: stackTrace,
      );

      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }
}
