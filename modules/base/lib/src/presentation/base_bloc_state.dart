import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BaseBlocState extends Equatable {
  const BaseBlocState({
    required this.isLoading,
    required this.errorMessage,
  });

  final bool isLoading;

  final String errorMessage;

  bool get hasError => errorMessage.isNotEmpty;

  @override
  List<Object?> get props => <Object?>[isLoading, errorMessage];
}
