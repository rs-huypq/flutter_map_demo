import 'package:flutter_map_demo/controller/map_view_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

part 'map_view_state.freezed.dart';

@freezed
class MapViewState with _$MapViewState {
  factory MapViewState({
    String? serviceError,
    LocationData? currentLocation,
    PlaceInfo? placeInfoSelected,
    @Default(<LatLng>[]) List<LatLng> listLatLng,
  }) = _MapViewState;
}
