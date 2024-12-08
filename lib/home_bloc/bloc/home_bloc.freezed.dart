// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  List<HomeModel> get homesList => throw _privateConstructorUsedError;
  List<HomeModel> get searchList => throw _privateConstructorUsedError;
  LatLng get userPosition => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      List<HomeModel> homesList,
      List<HomeModel> searchList,
      LatLng userPosition});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSearching = null,
    Object? homesList = null,
    Object? searchList = null,
    Object? userPosition = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      homesList: null == homesList
          ? _value.homesList
          : homesList // ignore: cast_nullable_to_non_nullable
              as List<HomeModel>,
      searchList: null == searchList
          ? _value.searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<HomeModel>,
      userPosition: null == userPosition
          ? _value.userPosition
          : userPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      List<HomeModel> homesList,
      List<HomeModel> searchList,
      LatLng userPosition});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSearching = null,
    Object? homesList = null,
    Object? searchList = null,
    Object? userPosition = null,
  }) {
    return _then(_$HomeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      homesList: null == homesList
          ? _value._homesList
          : homesList // ignore: cast_nullable_to_non_nullable
              as List<HomeModel>,
      searchList: null == searchList
          ? _value._searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<HomeModel>,
      userPosition: null == userPosition
          ? _value.userPosition
          : userPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.isLoading,
      required this.isSearching,
      required final List<HomeModel> homesList,
      required final List<HomeModel> searchList,
      required this.userPosition})
      : _homesList = homesList,
        _searchList = searchList;

  @override
  final bool isLoading;
  @override
  final bool isSearching;
  final List<HomeModel> _homesList;
  @override
  List<HomeModel> get homesList {
    if (_homesList is EqualUnmodifiableListView) return _homesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homesList);
  }

  final List<HomeModel> _searchList;
  @override
  List<HomeModel> get searchList {
    if (_searchList is EqualUnmodifiableListView) return _searchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchList);
  }

  @override
  final LatLng userPosition;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, isSearching: $isSearching, homesList: $homesList, searchList: $searchList, userPosition: $userPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._homesList, _homesList) &&
            const DeepCollectionEquality()
                .equals(other._searchList, _searchList) &&
            (identical(other.userPosition, userPosition) ||
                other.userPosition == userPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSearching,
      const DeepCollectionEquality().hash(_homesList),
      const DeepCollectionEquality().hash(_searchList),
      userPosition);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final bool isLoading,
      required final bool isSearching,
      required final List<HomeModel> homesList,
      required final List<HomeModel> searchList,
      required final LatLng userPosition}) = _$HomeStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  List<HomeModel> get homesList;
  @override
  List<HomeModel> get searchList;
  @override
  LatLng get userPosition;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
