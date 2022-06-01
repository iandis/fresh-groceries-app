import 'dart:async' show FutureOr;

abstract class Action<INPUT, OUTPUT> {
  const Action();

  FutureOr<OUTPUT> call(INPUT input);
}

abstract class NoInputAction<OUTPUT> extends Action<void, OUTPUT> {
  const NoInputAction();

  @override
  FutureOr<OUTPUT> call([void input]);
}

abstract class NoOutputAction<INPUT> extends Action<INPUT, void> {
  const NoOutputAction();

  @override
  FutureOr<void> call(INPUT input);
}

abstract class VoidAction extends Action<void, void> {
  const VoidAction();

  @override
  FutureOr<void> call([void input]);
}
