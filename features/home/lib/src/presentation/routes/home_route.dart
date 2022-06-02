import 'package:base/base.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/presentation/pages/home_page.dart';
import 'package:injectable/injectable.dart';
import 'package:product/product.dart';

@Named(HomeRoute.name)
@viewRoute
class HomeRoute extends DefaultViewRoute {
  static const String name = 'home-page';

  @override
  Widget builder(
    BuildContext context,
    GetDependencyFunc get,
    RouteSettings settings,
  ) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<CategoryListBloc>(
          create: (_) => get<CategoryListBloc>(),
        ),
        BlocProvider<ProductListBloc>(
          create: (_) => get<ProductListBloc>(),
        ),
      ],
      child: const HomePage(),
    );
  }
}
