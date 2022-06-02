import 'dart:async';
import 'dart:developer';

import 'package:base/base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:product/src/domain/actions/do_get_product_list.dart';
import 'package:product/src/domain/actions/do_listen_category_list_state.dart';
import 'package:product/src/domain/entities/category.dart';
import 'package:product/src/domain/entities/product.dart';
import 'package:product/src/domain/inputs/get_product_list_input.dart';
import 'package:product/src/presentation/blocs/category_list/category_list_bloc.dart';
import 'package:rxdart/transformers.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

@lazySingleton
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(
    this._doGetProductList,
    DoListenCategoryListState doListenCategoryListState,
  ) : super(const ProductListState.init()) {
    on<ProductListLoadEvent>(_onLoad);
    on<ProductListSearchEvent>(
      _onSearch,
      transformer: _onDebounceSearchEvent,
    );
    _categoryListStateSubscription =
        doListenCategoryListState(_onCategoryListStateChanged);
  }

  final DoGetProductList _doGetProductList;

  late final StreamSubscription<CategoryListState>
      _categoryListStateSubscription;

  void _onCategoryListStateChanged(CategoryListState categoryListState) {
    if (categoryListState.categoryList.isEmpty) return;

    final Category selectedCategory =
        categoryListState.categoryList[categoryListState.selectedIndex];

    add(ProductListLoadEvent(categoryId: selectedCategory.id));
  }

  @override
  void onTransition(Transition<ProductListEvent, ProductListState> transition) {
    super.onTransition(transition);

    log(
      'Event: ${transition.event}\n'
      'CurrentState: ${transition.currentState}\n'
      'NextState: ${transition.nextState}',
      name: 'ProductListBloc.onTransition',
    );
  }

  Future<void> _onLoad(
    ProductListLoadEvent event,
    Emitter<ProductListState> emit,
  ) async {
    final bool isLoadMore = event.isLoadMore;

    if (state.isLoading || (isLoadMore && state.isAtEndOfPage)) {
      return;
    }

    final String categoryId = event.categoryId ?? state.categoryId;

    assert(categoryId.isNotEmpty, '`categoryId` cannot be empty.');

    final bool isChangeCategory = categoryId != state.categoryId;

    emit(state.copyWith(
      categoryId: categoryId,
      isLoading: true,
      isAtEndOfPage: !isLoadMore ? false : null,
      productList: isChangeCategory ? const <Product>[] : null,
    ));

    final int nextPage = isLoadMore ? state.currentPage + 1 : 0;

    try {
      final GetProductListInput params = GetProductListInput(
        categoryId: categoryId,
        page: nextPage,
        searchText: state.searchText,
      );

      final List<Product> result = await _doGetProductList(params);

      final List<Product> nextProductList =
          isLoadMore ? <Product>[...state.productList, ...result] : result;

      emit(state.copyWith(
        isLoading: false,
        currentPage: nextPage,
        isAtEndOfPage: result.isEmpty,
        productList: nextProductList,
      ));
    } catch (error, stackTrace) {
      log(
        'An error caught while loading product list:\n$event',
        name: 'ProductListBloc._onLoad',
        error: error,
        stackTrace: stackTrace,
      );

      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  Stream<ProductListSearchEvent> _onDebounceSearchEvent(
    Stream<ProductListSearchEvent> events,
    EventMapper<ProductListSearchEvent> mapper,
  ) {
    return events.debounceTime(const Duration(milliseconds: 500));
  }

  Future<void> _onSearch(
    ProductListSearchEvent event,
    Emitter<ProductListState> emit,
  ) async {
    if (state.isLoading) return;

    final String categoryId = state.categoryId;

    final String searchText = event.searchText;

    emit(
      state.copyWith(
        searchText: searchText,
        isAtEndOfPage: false,
        isLoading: true,
      ),
    );

    try {
      final GetProductListInput params = GetProductListInput(
        categoryId: categoryId,
        page: 0,
        searchText: searchText,
      );

      final List<Product> result = await _doGetProductList(params);

      emit(state.copyWith(
        isLoading: false,
        currentPage: 0,
        isAtEndOfPage: result.isEmpty,
        productList: result,
      ));
    } catch (error, stackTrace) {
      log(
        'An error caught while searching product list:\n$event',
        name: 'ProductListBloc._onSearch',
        error: error,
        stackTrace: stackTrace,
      );

      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    _categoryListStateSubscription.cancel();
    return super.close();
  }
}
