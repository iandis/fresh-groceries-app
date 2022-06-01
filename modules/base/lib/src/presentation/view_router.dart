import 'package:base/src/presentation/view_route.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

class ViewRouter {
  const ViewRouter(this._getIt);

  final GetIt _getIt;

  @nonVirtual
  Route<dynamic> call(RouteSettings settings) {
    final ViewRoute viewRoute = _getIt<ViewRoute>(instanceName: settings.name);
    return viewRoute(_getIt.call, settings);
  }
}
