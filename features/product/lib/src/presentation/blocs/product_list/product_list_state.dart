part of 'product_list_bloc.dart';

class ProductListState extends BaseBlocState {
  const ProductListState({
    required this.categoryId,
    required this.searchText,
    required this.currentPage,
    required this.isAtEndOfPage,
    required this.productList,
    required bool isLoading,
    required String errorMessage,
  }) : super(isLoading: isLoading, errorMessage: errorMessage);

  const ProductListState.init()
      : categoryId = '',
        searchText = '',
        currentPage = 0,
        isAtEndOfPage = false,
        productList = const <Product>[],
        super(
          isLoading: false,
          errorMessage: '',
        );

  final String categoryId;

  final String searchText;

  final int currentPage;

  final bool isAtEndOfPage;

  final List<Product> productList;

  ProductListState copyWith({
    String? categoryId,
    String? searchText,
    int? currentPage,
    bool? isAtEndOfPage,
    List<Product>? productList,
    bool? isLoading,
    String errorMessage = '',
  }) {
    return ProductListState(
      categoryId: categoryId ?? this.categoryId,
      searchText: searchText ?? this.searchText,
      currentPage: currentPage ?? this.currentPage,
      isAtEndOfPage: isAtEndOfPage ?? this.isAtEndOfPage,
      productList: productList ?? this.productList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        ...super.props,
        categoryId,
        searchText,
        currentPage,
        isAtEndOfPage,
        productList,
      ];
}
