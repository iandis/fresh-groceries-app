import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

const Singleton viewRoute = Singleton(as: ViewRoute);

typedef GetDependencyFunc = T Function<T extends Object>({
  String? instanceName,
});

extension RouteSettingsExtension on RouteSettings {
  T castArg<T extends Object>() {
    final Object? arguments = this.arguments;

    if (arguments is T) return arguments;

    throw ArgumentError.value(
      arguments.runtimeType,
      'RouteSettings.arguments',
      'Invalid argument type of [${arguments.runtimeType}]',
    );
  }

  T? castArgOrNull<T extends Object>() {
    final Object? arguments = this.arguments;

    if (arguments is T) return arguments;

    return null;
  }
}

abstract class ViewRoute {
  Route<dynamic> call(GetDependencyFunc get, RouteSettings settings);
}

abstract class DefaultViewRoute extends ViewRoute {
  Widget builder(
    BuildContext context,
    GetDependencyFunc get,
    RouteSettings settings,
  );

  @override
  @nonVirtual
  Route<dynamic> call(GetDependencyFunc get, RouteSettings settings) {
    return CupertinoPageRoute<dynamic>(
      settings: settings,
      builder: (BuildContext context) => builder(context, get, settings),
    );
  }
}
