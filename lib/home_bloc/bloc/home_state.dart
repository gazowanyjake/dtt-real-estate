part of 'home_bloc.dart';



@freezed
 class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isSearching,
    required List<HomeModel> homesList,
    required List<HomeModel> searchList,
    required LatLng userPosition,
  }) = _HomeState;


 factory HomeState.initial() => HomeState(
  isLoading: true,
  isSearching: false,
  homesList: [],
  searchList: [],
  userPosition: LatLng(0,0),
 );
}