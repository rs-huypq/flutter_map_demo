import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_demo/model/map_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'package:state_notifier/state_notifier.dart';

final mapViewProvider =
    StateNotifierProvider<MapViewStateNotifier, MapViewState>(
        (_) => MapViewStateNotifier());

class MapViewStateNotifier extends StateNotifier<MapViewState>
    with LocatorMixin {
  MapViewStateNotifier() : super(MapViewState());

  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    initLocationService();
  }

  Future<void> initLocationService() async {
    final Location _locationService = Location();

    await _locationService.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000,
    );

    LocationData? location;
    bool serviceEnabled;
    bool serviceRequestResult;
    bool _liveUpdate = false;
    bool _permission = false;

    try {
      serviceEnabled = await _locationService.serviceEnabled();

      if (serviceEnabled) {
        var permission = await _locationService.requestPermission();
        _permission = permission == PermissionStatus.granted;

        if (_permission) {
          location = await _locationService.getLocation();
          state = state.copyWith(currentLocation: location);
          _locationService.onLocationChanged.listen(
            (LocationData result) async {
              if (mounted) {
                state = state.copyWith(currentLocation: result);
              }
            },
          );
        }
      } else {
        serviceRequestResult = await _locationService.requestService();
        if (serviceRequestResult) {
          initLocationService();
          return;
        }
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      if (e.code == 'PERMISSION_DENIED') {
        state = state.copyWith(serviceError: e.message);
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        state = state.copyWith(serviceError: e.message);
      }
      location = null;
    }
  }

  Future<bool> getInfoLocationSelected(
    TapPosition tapPosition,
    LatLng latlng,
  ) async {
    final listLatLng = state.listLatLng;

    if (listLatLng.isNotEmpty) {
      state = state.copyWith(listLatLng: [], placeInfoSelected: null);
      return false;
    }
    final places = await geocoding.placemarkFromCoordinates(
      latlng.latitude,
      latlng.longitude,
    );
    final placeInfo = PlaceInfo(
      city: places.first.administrativeArea,
      district: places.first.subAdministrativeArea,
      country: places.first.country,
      street: places.first.street,
    );

    state = state.copyWith(
      listLatLng: [latlng],
      placeInfoSelected: placeInfo,
    );
    return true;
  }

  Future<bool> currentLocation(MapController mapController) async {
    var location = Location();
    var currentLocation = state.currentLocation;
    currentLocation ??= await location.getLocation();
    state = state.copyWith(currentLocation: currentLocation);

    try {
      var moved = mapController.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        14,
      );

      if (moved) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> getInfoPlace(LatLng latLng) async {}
}

class PlaceInfo {
  PlaceInfo({
    this.country,
    this.city,
    this.street,
    this.district,
  });

  final String? country;
  final String? city;
  final String? street;
  final String? district;
}
