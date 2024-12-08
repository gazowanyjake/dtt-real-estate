import 'package:dtt/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import '../widget/map_widge.dart';

class HomeInfoScreen extends StatelessWidget {
  static const routeName = '/home-info-screen';

  const HomeInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const String bedIcon = 'assets/icons/ic_bed.svg';
    const String bathIcon = 'assets/icons/ic_bath.svg';
    const String layersIcon = 'assets/icons/ic_layers.svg';
    const String locationIcon = 'assets/icons/ic_location.svg';
    final Widget bedWidget = SvgPicture.asset(
      bedIcon,
      height: 18,
      color: Theme.of(context).textTheme.bodyMedium!.color,
    );
    final Widget bathWidget = SvgPicture.asset(
      bathIcon,
      height: 18,
      color: Theme.of(context).textTheme.bodyMedium!.color,
    );
    final Widget layersWidget = SvgPicture.asset(
      layersIcon,
      height: 18,
      color: Theme.of(context).textTheme.bodyMedium!.color,
    );
    final Widget locationWidget = SvgPicture.asset(
      locationIcon,
      height: 18,
      color: Theme.of(context).textTheme.bodyMedium!.color,
    );
    final HomeModel home =
        ModalRoute.of(context)!.settings.arguments as HomeModel;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                home.image,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
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
                          bedWidget,
                          SizedBox(width: 2),
                          Text(home.bedrooms.toString(),
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(width: 10),
                          bathWidget,
                          SizedBox(width: 2),
                          Text(home.bathrooms.toString(),
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(width: 10),
                          layersWidget,
                          SizedBox(width: 2),
                          Text(home.size.toString(),
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(width: 10),
                          locationWidget,
                          SizedBox(width: 2),
                          Text('${home.distance} km',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  Text('Description',
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 8),
                  Text(home.description,
                      style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 32),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
