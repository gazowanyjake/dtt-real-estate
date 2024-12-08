import 'package:dtt/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeInfoScreen extends StatelessWidget {
  static const routeName = '/home-info-screen';

  const HomeInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeModel home =
        ModalRoute.of(context)!.settings.arguments as HomeModel;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            
            slivers: [
              // app bar
              SliverAppBar(
                bottom: PreferredSize(
                  preferredSize: Size(50, 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        50,
                      ),
                    ),
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                expandedHeight: 250,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    home.image,
                    fit: BoxFit.cover,
                  ),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // content
              SliverToBoxAdapter(
                child: Container(
                  color: Theme.of(context)
                      .colorScheme
                      .primary, // Background color of the container
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${home.price}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(width: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.bed,
                                size: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              SizedBox(width: 2),
                              Text(home.bedrooms.toString(),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              SizedBox(width: 10),
                              Icon(
                                Icons.bathtub,
                                size: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              SizedBox(width: 2),
                              Text(home.bathrooms.toString(),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              SizedBox(width: 10),
                              Icon(
                                Icons.square_foot,
                                size: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              SizedBox(width: 2),
                              Text(home.size.toString(),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              SizedBox(width: 10),
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              SizedBox(width: 2),
                              Text('${home.distance}km',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          )
                        ],
                      ),

                      SizedBox(height: 32),

                      //description
                      Text('Description',
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: 8),
                      Text(home.description,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: 32),

                      // location
                      Text('Location',
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: MapWidget(
                              homeLocation: LatLng(
                                home.latitude,
                                home.longitude,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  MapWidget({
    super.key,
    required this.homeLocation,
  });

  LatLng homeLocation;
  @override
  Widget build(BuildContext context) {
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
              width: 80.0,
              height: 80.0,
              point: homeLocation,
              child: Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 40.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
