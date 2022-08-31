part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeEventGetItem extends HomeEvent{
  final String textSearch;

  HomeEventGetItem({required this.textSearch});

  @override
  List<Object?> get props => [textSearch];
}

