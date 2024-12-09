import 'package:dtt/home_bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.homeLocation,
  });

  final LatLng homeLocation;
  @override
  Widget build(BuildContext context) {
    const String locationIcon = 'assets/icons/ic_location.svg';
    final Widget locationWidget = SvgPicture.asset(locationIcon,
        height: 10, color: Theme.of(context).colorScheme.surface);
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
              child: GestureDetector(
                child: locationWidget,
                onTap: () => context.read<HomeBloc>().add(
                      LaunchMapEvent(
                        location: homeLocation,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
