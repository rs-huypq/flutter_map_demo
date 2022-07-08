import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';

part 'map_view_state.freezed.dart';

@freezed
class MapViewState with _$MapViewState {
  factory MapViewState({
    String? serviceError,
    LocationData? currentLocation,
  }) = _MapViewState;
}
