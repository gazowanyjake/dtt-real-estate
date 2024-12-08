part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomesEvent extends HomeEvent {}

class GetUserPositionEvent extends HomeEvent {}

class SearchHomeEvent extends HomeEvent {
  SearchHomeEvent({
    required this.city,
  });
  final String city;
}
class StopSearchingEvent extends HomeEvent {}
