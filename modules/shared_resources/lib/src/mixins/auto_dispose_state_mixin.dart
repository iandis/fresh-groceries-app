import 'dart:async';

import 'package:flutter/widgets.dart';

mixin AutoDisposeStateMixin<S extends StatefulWidget> on State<S> {
  final List<Object> _disposables = <Object>[];

  @override
  void dispose() {
    _disposeAll();
    super.dispose();
  }

  T autoDispose<T extends Object>(T disposable) {
    assert(
      disposable is ChangeNotifier ||
          disposable is StreamSink ||
          disposable is StreamSubscription,
      'Unknown disposable object of $T',
    );

    assert(
      !_disposables.contains(disposable),
      '$disposable was already registered inside AutoDisposeStateMixin!',
    );

    _disposables.add(disposable);

    return disposable;
  }

  void _disposeAll() {
    while (_disposables.isNotEmpty) {
      final Object disposable = _disposables.removeLast();

      if (disposable is ChangeNotifier) {
        disposable.dispose();
      } else if (disposable is StreamSink) {
        disposable.close();
      } else if (disposable is StreamSubscription) {
        disposable.cancel();
      }
    }
  }
}
