import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:fresh_groceries_app/init_di.dart';
import 'package:get_it/get_it.dart';
import 'package:home/home.dart';
import 'package:shared_resources/shared_resources.dart';

void main() {
  final GetIt getIt = GetIt.I;
  final ViewRouter viewRouter = ViewRouter(
    getIt: getIt,
    initialRoute: HomeRoute.name,
  );
  initDI(getIt);

  runApp(
    App(viewRouter: viewRouter),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required ViewRouter viewRouter,
  })  : _viewRouter = viewRouter,
        super(key: key);

  final ViewRouter _viewRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Groceries',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ThemeColors.primary,
        elevatedButtonTheme: Themes.primaryButtonThemeData,
        outlinedButtonTheme: Themes.outlinedButtonThemeData,
        scaffoldBackgroundColor: ThemeColors.white,
        backgroundColor: ThemeColors.white,
        appBarTheme: Themes.appBarTheme,
      ),
      initialRoute: _viewRouter.initialRoute,
      onGenerateRoute: _viewRouter,
    );
  }
}
