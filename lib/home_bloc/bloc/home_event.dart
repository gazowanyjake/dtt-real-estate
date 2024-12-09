part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomesEvent extends HomeEvent {}

class GetUserPositionEvent extends HomeEvent {}

class SearchHomeEvent extends HomeEvent {
  SearchHomeEvent({
    required this.input,
  });
  final String input;
}

class StopSearchingEvent extends HomeEvent {}

class LaunchUrlEvent extends HomeEvent {
  LaunchUrlEvent({
    required this.url,
  });
  final String url;
}

class LaunchMapEvent extends HomeEvent {
  LaunchMapEvent({
    required this.location,
  });
  final LatLng location;
}
