part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateGetItem extends HomeState{
  final ItemModel item;

  HomeStateGetItem({required this.item});

  @override
  List<Object?> get props => [item];
}
