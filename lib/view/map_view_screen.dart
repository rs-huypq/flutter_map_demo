import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_demo/app_constant.dart';
import 'package:flutter_map_demo/controller/map_view_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapViewScreen extends ConsumerWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Variable for map controller
    late final MapController _mapController;

    // Variable for state notifier
    final state = ref.watch(mapViewProvider);
    final stateNotifier = ref.read(mapViewProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(AppConstants.latDefault, AppConstants.lngDefault),
            zoom: AppConstants.zoomDefault,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: AppConstants.urlMapTemplate,
              subdomains: ['a', 'b', 'c'],
              tileProvider: const NonCachingNetworkTileProvider(),
            ),
            MarkerLayerOptions(markers: [])
          ],
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap',
              onSourceTapped: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
