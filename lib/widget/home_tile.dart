import 'package:dtt/model/home_model.dart';
import 'package:dtt/screens/home_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    required this.home,
    super.key,
  });
  final HomeModel home;

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
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(HomeInfoScreen.routeName, arguments: home),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(home.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${home.price}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(home.city,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          bedWidget,
                          SizedBox(width: 4),
                          Text(
                            home.bedrooms.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(width: 16),
                          bathWidget,
                          SizedBox(width: 4),
                          Text(
                            home.bathrooms.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(width: 16),
                          layersWidget,
                          SizedBox(width: 4),
                          Text(
                            home.size.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(width: 16),
                          locationWidget,
                          SizedBox(width: 4),
                          Text(
                            '${home.distance} km',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
