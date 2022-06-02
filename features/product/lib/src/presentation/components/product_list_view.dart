import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/src/domain/entities/product.dart';
import 'package:product/src/presentation/blocs/category_list/category_list_bloc.dart';
import 'package:product/src/presentation/blocs/product_list/product_list_bloc.dart';
import 'package:product/src/presentation/components/category_sliver_horizontal_list_view.dart';
import 'package:product/src/presentation/components/product_sliver_list.dart';
import 'package:product/src/presentation/components/product_sliver_search_bar.dart';
import 'package:shared_resources/shared_resources.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView>
    with
        AutoDisposeStateMixin<ProductListView>,
        ScrollListenerMixin<ProductListView> {
  late final ProductListBloc _productListBloc;

  late final ScrollController _scrollController = autoDispose(
    ScrollController(),
  );

  @override
  ScrollController get scrollController => _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductListBloc, ProductListState>(
      listener: _onProductListStateChanged,
      builder: (_, ProductListState state) {
        final bool shouldShowLoadingList =
            state.isLoading && state.productList.isEmpty;

        final bool shouldShowLoadingAtBottom =
            state.isLoading && state.productList.isNotEmpty;

        return CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: <Widget>[
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: ProductSliverSearchBar(),
              ),
            ),
            const SliverPersistentHeader(
              pinned: true,
              delegate: CategorySliverHorizontalListView(),
            ),
            CupertinoSliverRefreshControl(onRefresh: _onRefresh),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              sliver: ProductSliverList(
                shouldShowLoadingList: shouldShowLoadingList,
                productList: state.productList,
                onBuyPressed: _onBuyProductPressed,
              ),
            ),
            SliverToBoxAdapter(
              child: shouldShowLoadingAtBottom
                  ? const Center(child: Text('Loading...'))
                  : const SizedBox.shrink(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<CategoryListBloc>().add(CategoryListLoadEvent());
    _productListBloc = context.read<ProductListBloc>();
  }

  void _onLoadProductList({bool isLoadMore = false}) {
    _productListBloc.add(
      ProductListLoadEvent(isLoadMore: isLoadMore),
    );
  }

  @override
  void onAlmostAtEnd() {
    if (_productListBloc.state.isLoading) return;
    _onLoadProductList(isLoadMore: true);
  }

  Future<void> _onRefresh() async {
    _onLoadProductList();
    await for (final ProductListState state in _productListBloc.stream) {
      if (!state.isLoading) {
        break;
      }
    }
  }

  void _onProductListStateChanged(
    BuildContext context,
    ProductListState state,
  ) {
    if (state.hasError) {
      _onShowError(state.errorMessage);
    }
  }

  void _onBuyProductPressed(Product product) {}

  void _onShowError(String errorMessage) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
  }
}
