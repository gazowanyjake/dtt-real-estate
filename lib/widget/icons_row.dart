import 'package:dtt/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsRow extends StatelessWidget {
  final HomeModel home;
  const IconsRow({
    required this.home,
    super.key,
  });

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
    return Row(
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
    );
  }
}
