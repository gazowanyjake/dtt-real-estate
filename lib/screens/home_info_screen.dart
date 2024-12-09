import 'package:dtt/model/home_model.dart';
import 'package:dtt/widget/icons_row.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../widget/map_widge.dart';

class HomeInfoScreen extends StatelessWidget {
  static const routeName = '/home-info-screen';

  const HomeInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                      IconsRow(home: home),
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
