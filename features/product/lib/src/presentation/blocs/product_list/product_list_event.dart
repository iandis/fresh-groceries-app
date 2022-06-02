part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class ProductListLoadEvent extends ProductListEvent {
  ProductListLoadEvent({
    this.categoryId,
    this.isLoadMore = false,
  });

  final String? categoryId;

  final bool isLoadMore;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => <Object?>[categoryId, isLoadMore];
}

class ProductListSearchEvent extends ProductListEvent {
  ProductListSearchEvent({
    required this.searchText,
  });

  final String searchText;

  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => <Object?>[searchText];
}
