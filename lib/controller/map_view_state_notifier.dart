import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map_demo/model/map_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:state_notifier/state_notifier.dart';

final mapViewProvider =
    StateNotifierProvider<MapViewStateNotifier, MapViewState>(
        (_) => MapViewStateNotifier());

class MapViewStateNotifier extends StateNotifier<MapViewState>
    with LocatorMixin {
  MapViewStateNotifier() : super(MapViewState());

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
}
