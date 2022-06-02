part of 'category_list_bloc.dart';

class CategoryListState extends BaseBlocState {
  const CategoryListState({
    required bool isLoading,
    required String errorMessage,
    required this.selectedIndex,
    required this.categoryList,
  }) : super(isLoading: isLoading, errorMessage: errorMessage);

  const CategoryListState.init()
      : selectedIndex = 0,
        categoryList = const <Category>[],
        super(isLoading: false, errorMessage: '');

  final int selectedIndex;

  final List<Category> categoryList;

  @override
  List<Object?> get props => <Object?>[
        ...super.props,
        selectedIndex,
        categoryList,
      ];

  CategoryListState copyWith({
    bool? isLoading,
    int? selectedIndex,
    List<Category>? categoryList,
    String errorMessage = '',
  }) {
    return CategoryListState(
      isLoading: isLoading ?? this.isLoading,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      categoryList: categoryList ?? this.categoryList,
      errorMessage: errorMessage,
    );
  }
}
