class GetProductListInput {
  const GetProductListInput({
    required this.categoryId,
    required this.page,
    this.limit = 10,
    this.searchText = '',
  });

  final int page;

  final int limit;

  final String categoryId;

  final String searchText;
}
