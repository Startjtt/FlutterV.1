import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app2/models/item_model.dart';

import '../../services/item_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final _itemService = ItemService();

  HomeBloc() : super(HomeStateLoading()) {
    on<HomeEventGetItem>(_mapHomeGetItemToState);
  }

  _mapHomeGetItemToState(HomeEventGetItem event, Emitter<HomeState> emit) async{

    emit(HomeStateLoading());

    await Future.delayed(Duration(seconds: 2));

    var itemData = await _itemService.itemList(textSearch: event.textSearch);

    emit(HomeStateGetItem(item: itemData));

  }
}
