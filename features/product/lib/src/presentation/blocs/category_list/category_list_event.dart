part of 'category_list_bloc.dart';

@immutable
abstract class CategoryListEvent extends Equatable {
  const CategoryListEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class CategoryListLoadEvent extends CategoryListEvent {}

class CategoryListSelectEvent extends CategoryListEvent {
  const CategoryListSelectEvent(this.selectedIndex);

  final int selectedIndex;

  @override
  List<Object?> get props => <Object?>[selectedIndex];
}
