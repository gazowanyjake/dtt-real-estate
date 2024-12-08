import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapWidget extends StatelessWidget {
  MapWidget({
    super.key,
    required this.homeLocation,
  });

  LatLng homeLocation;
  @override
  Widget build(BuildContext context) {
    const String locationIcon = 'assets/icons/ic_location.svg';
    final Widget locationWidget = SvgPicture.asset(
      locationIcon,
      height: 10,
      color: Theme.of(context).colorScheme.surface
    );
    return FlutterMap(
      options: MapOptions(
        initialCenter: homeLocation,
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 60.0,
              height: 60.0,
              point: homeLocation,
              child: locationWidget,
            ),
          ],
        ),
      ],
    );
  }
}
