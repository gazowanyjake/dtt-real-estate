import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dtt/home_bloc/interface/home_interface.dart';
import 'package:dtt/model/home_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dtt/dartz_extension.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.service) : super(HomeState.initial()) {
    on<GetHomesEvent>(_onGetHomes);
    on<GetUserPositionEvent>(_onGetUserPosition);
    on<SearchHomeEvent>(_onSearchHome);
    on<StopSearchingEvent>(_onStopSearching);
    on<LaunchUrlEvent>(_onLaunchUrl);
    on<LaunchMapEvent>(_onLaunchMapEvent);
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
    if (result.isLeft()) {
      emit(
        state.copyWith(
          userPosition: LatLng(0, 0),
        ),
      );
    } else {
      emit(
        state.copyWith(
          userPosition: result.getRightOrThrow(),
        ),
      );
    }
  }

  FutureOr<void> _onSearchHome(SearchHomeEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        isSearching: true,
      ),
    );
    final searchCity = state.homesList.where(
      (home) {
        return home.city.toLowerCase().contains(
              event.input.toLowerCase(),
            );
      },
    ).toList();

    final searchZip = state.homesList.where(
      (home) {
        return home.zip.toLowerCase().contains(
              event.input.toLowerCase(),
            );
      },
    ).toList();

    final searchCombined = searchZip + searchCity;
    final searchResult = searchCombined.toSet();
    emit(
      state.copyWith(
        searchList: searchResult.toList(),
      ),
    );
  }

  FutureOr<void> _onStopSearching(
      StopSearchingEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        isSearching: false,
      ),
    );
  }

  FutureOr<void> _onLaunchUrl(
      LaunchUrlEvent event, Emitter<HomeState> emit) async {
    if (!await launchUrl(
      Uri.parse(event.url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch');
    }
  }

  FutureOr<void> _onLaunchMapEvent(
      LaunchMapEvent event, Emitter<HomeState> emit) async {
    try {
      await MapsLauncher.launchCoordinates(
        event.location.latitude,
        event.location.longitude,
      );
    } catch (error) {}
  }
}
