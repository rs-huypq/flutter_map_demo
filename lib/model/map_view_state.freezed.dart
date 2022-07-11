// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MapViewStateTearOff {
  const _$MapViewStateTearOff();

  _MapViewState call(
      {String? serviceError,
      LocationData? currentLocation,
      PlaceInfo? placeInfoSelected,
      List<LatLng> listLatLng = const <LatLng>[]}) {
    return _MapViewState(
      serviceError: serviceError,
      currentLocation: currentLocation,
      placeInfoSelected: placeInfoSelected,
      listLatLng: listLatLng,
    );
  }
}

/// @nodoc
const $MapViewState = _$MapViewStateTearOff();

/// @nodoc
mixin _$MapViewState {
  String? get serviceError => throw _privateConstructorUsedError;
  LocationData? get currentLocation => throw _privateConstructorUsedError;
  PlaceInfo? get placeInfoSelected => throw _privateConstructorUsedError;
  List<LatLng> get listLatLng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapViewStateCopyWith<MapViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapViewStateCopyWith<$Res> {
  factory $MapViewStateCopyWith(
          MapViewState value, $Res Function(MapViewState) then) =
      _$MapViewStateCopyWithImpl<$Res>;
  $Res call(
      {String? serviceError,
      LocationData? currentLocation,
      PlaceInfo? placeInfoSelected,
      List<LatLng> listLatLng});
}

/// @nodoc
class _$MapViewStateCopyWithImpl<$Res> implements $MapViewStateCopyWith<$Res> {
  _$MapViewStateCopyWithImpl(this._value, this._then);

  final MapViewState _value;
  // ignore: unused_field
  final $Res Function(MapViewState) _then;

  @override
  $Res call({
    Object? serviceError = freezed,
    Object? currentLocation = freezed,
    Object? placeInfoSelected = freezed,
    Object? listLatLng = freezed,
  }) {
    return _then(_value.copyWith(
      serviceError: serviceError == freezed
          ? _value.serviceError
          : serviceError // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: currentLocation == freezed
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      placeInfoSelected: placeInfoSelected == freezed
          ? _value.placeInfoSelected
          : placeInfoSelected // ignore: cast_nullable_to_non_nullable
              as PlaceInfo?,
      listLatLng: listLatLng == freezed
          ? _value.listLatLng
          : listLatLng // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc
abstract class _$MapViewStateCopyWith<$Res>
    implements $MapViewStateCopyWith<$Res> {
  factory _$MapViewStateCopyWith(
          _MapViewState value, $Res Function(_MapViewState) then) =
      __$MapViewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? serviceError,
      LocationData? currentLocation,
      PlaceInfo? placeInfoSelected,
      List<LatLng> listLatLng});
}

/// @nodoc
class __$MapViewStateCopyWithImpl<$Res> extends _$MapViewStateCopyWithImpl<$Res>
    implements _$MapViewStateCopyWith<$Res> {
  __$MapViewStateCopyWithImpl(
      _MapViewState _value, $Res Function(_MapViewState) _then)
      : super(_value, (v) => _then(v as _MapViewState));

  @override
  _MapViewState get _value => super._value as _MapViewState;

  @override
  $Res call({
    Object? serviceError = freezed,
    Object? currentLocation = freezed,
    Object? placeInfoSelected = freezed,
    Object? listLatLng = freezed,
  }) {
    return _then(_MapViewState(
      serviceError: serviceError == freezed
          ? _value.serviceError
          : serviceError // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: currentLocation == freezed
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      placeInfoSelected: placeInfoSelected == freezed
          ? _value.placeInfoSelected
          : placeInfoSelected // ignore: cast_nullable_to_non_nullable
              as PlaceInfo?,
      listLatLng: listLatLng == freezed
          ? _value.listLatLng
          : listLatLng // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc

class _$_MapViewState implements _MapViewState {
  _$_MapViewState(
      {this.serviceError,
      this.currentLocation,
      this.placeInfoSelected,
      this.listLatLng = const <LatLng>[]});

  @override
  final String? serviceError;
  @override
  final LocationData? currentLocation;
  @override
  final PlaceInfo? placeInfoSelected;
  @JsonKey()
  @override
  final List<LatLng> listLatLng;

  @override
  String toString() {
    return 'MapViewState(serviceError: $serviceError, currentLocation: $currentLocation, placeInfoSelected: $placeInfoSelected, listLatLng: $listLatLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapViewState &&
            const DeepCollectionEquality()
                .equals(other.serviceError, serviceError) &&
            const DeepCollectionEquality()
                .equals(other.currentLocation, currentLocation) &&
            const DeepCollectionEquality()
                .equals(other.placeInfoSelected, placeInfoSelected) &&
            const DeepCollectionEquality()
                .equals(other.listLatLng, listLatLng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceError),
      const DeepCollectionEquality().hash(currentLocation),
      const DeepCollectionEquality().hash(placeInfoSelected),
      const DeepCollectionEquality().hash(listLatLng));

  @JsonKey(ignore: true)
  @override
  _$MapViewStateCopyWith<_MapViewState> get copyWith =>
      __$MapViewStateCopyWithImpl<_MapViewState>(this, _$identity);
}

abstract class _MapViewState implements MapViewState {
  factory _MapViewState(
      {String? serviceError,
      LocationData? currentLocation,
      PlaceInfo? placeInfoSelected,
      List<LatLng> listLatLng}) = _$_MapViewState;

  @override
  String? get serviceError;
  @override
  LocationData? get currentLocation;
  @override
  PlaceInfo? get placeInfoSelected;
  @override
  List<LatLng> get listLatLng;
  @override
  @JsonKey(ignore: true)
  _$MapViewStateCopyWith<_MapViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
