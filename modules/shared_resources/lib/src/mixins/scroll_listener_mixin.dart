import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

mixin ScrollListenerMixin<S extends StatefulWidget> on State<S> {
  @protected
  ScrollController get scrollController;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScrollPositionChanged);
  }

  void _onScrollPositionChanged() {
    if (!scrollController.hasClients) return;

    final bool isScrollToEnd = scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;

    final bool isAlmostAtEnd = scrollController.offset >=
        scrollController.position.maxScrollExtent * 0.95;

    if (isScrollToEnd && isAlmostAtEnd) {
      onAlmostAtEnd();
    }
  }

  @protected
  void onAlmostAtEnd();
}
