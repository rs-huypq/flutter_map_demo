import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_demo/app_constant.dart';
import 'package:flutter_map_demo/components/dialogs.dart';
import 'package:flutter_map_demo/controller/map_view_state_notifier.dart';
import 'package:flutter_map_demo/model/map_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapViewScreen extends ConsumerWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Variable for state notifier
    final state = ref.watch(mapViewProvider);
    final stateNotifier = ref.read(mapViewProvider.notifier);

    return _Body(
      state: state,
      stateNotifier: stateNotifier,
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
    required this.state,
    required this.stateNotifier,
  }) : super(key: key);
  final MapViewState state;
  final MapViewStateNotifier stateNotifier;

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  // Variable for map controller
  final MapController _mapController = MapController();

  @override
  void initState() {
    _getCurrentLocation(
      context,
      _mapController,
      widget.stateNotifier,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: LatLng(AppConstants.latDefault, AppConstants.lngDefault),
            zoom: AppConstants.zoomDefault,
            onTap: widget.stateNotifier.getInfoLocationSelected,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: AppConstants.urlMapBox,
              additionalOptions: {
                'access_token': AppConstants.accessTokenMapBox
              },
            ),
            MarkerLayerOptions(
                markers: _buildListMarker(widget.state)
                  ..add(_iconCurrentLocation(widget.state))),
          ],
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'Mapbox',
              onSourceTapped: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => _getCurrentLocation(
          context,
          _mapController,
          widget.stateNotifier,
        ),
        child: const Icon(Icons.gps_fixed),
      ),
      bottomSheet: widget.state.placeInfoSelected == null
          ? null
          : _bottomInfoPlace(widget.state.placeInfoSelected!),
    );
  }

  Widget _bottomInfoPlace(PlaceInfo placeInfo) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            placeInfo.street ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${placeInfo.district}, ',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '${placeInfo.city}, ',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '${placeInfo.country}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Marker _iconCurrentLocation(MapViewState state) {
    final currentLocation = state.currentLocation;

    if (currentLocation == null) {
      return Marker(
        point: LatLng(0, 0),
        builder: (context) => const SizedBox(),
      );
    }

    final latLng = LatLng(
      currentLocation.latitude ?? 0,
      currentLocation.longitude ?? 0,
    );

    return Marker(
      point: latLng,
      builder: (context) => CircleAvatar(
        backgroundColor: Colors.blue.withOpacity(0.3),
        child: const Icon(
          Icons.person,
          color: Colors.blue,
        ),
      ),
    );
  }

  List<Marker> _buildListMarker(MapViewState state) {
    if (state.listLatLng.isEmpty) {
      return [];
    }
    final latLng = state.listLatLng.first;

    return [
      Marker(
        point: latLng,
        builder: (context) {
          return const Icon(
            Icons.location_on_sharp,
            color: Colors.red,
          );
        },
      ),
    ];
  }

  Future<void> _getCurrentLocation(
    BuildContext context,
    MapController mapController,
    MapViewStateNotifier stateNotifier,
  ) async {
    final isLocation = await stateNotifier.currentLocation(mapController);

    if (isLocation) {
      return;
    }
    // Dialogs(context)
    //     .showSimpleDialog('Không tìm thấy vị trí, vui lòng kiểm tra lại');
  }
}
