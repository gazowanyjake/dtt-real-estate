import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dtt/home_bloc/interface/home_interface.dart';
import 'package:dtt/model/home_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dtt/dartz_extension.dart';
import 'package:latlong2/latlong.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.service) : super(HomeState.initial()) {
    on<GetHomesEvent>(_onGetHomes);
    on<GetUserPositionEvent>(_onGetUserPosition);
    on<SearchHomeEvent>(_SearchHome);
    on<StopSearchingEvent>(_StopSearching);
  }
  final IHomeService service;

  FutureOr<void> _onGetHomes(
      GetHomesEvent event, Emitter<HomeState> emit) async {
    final result = await service.getHomes(state.userPosition);
    if (result.isLeft()) {
      return;
    } else {
      emit(
        state.copyWith(
          homesList: result.getRightOrThrow(),
          isLoading: false,
        ),
      );
    }
  }

  FutureOr<void> _onGetUserPosition(
      GetUserPositionEvent event, Emitter<HomeState> emit) async {
    final result = await service.getLocation();
    emit(
      state.copyWith(
        userPosition: result.getRightOrThrow(),
      ),
    );
  }

  FutureOr<void> _SearchHome(SearchHomeEvent event, Emitter<HomeState> emit) {
     emit(
      state.copyWith(
        isSearching: true,
      ),
    );
    final searchResult = state.homesList
        .where((home) =>
            home.city.toLowerCase().contains(event.city.toLowerCase()))
        .toList();
    emit(
      state.copyWith(
        searchList: searchResult,
      ),
    );
  }

  FutureOr<void> _StopSearching(StopSearchingEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        isSearching: false,
      ),
    );
  }
}
