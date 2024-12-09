import 'package:dtt/model/home_model.dart';
import 'package:dtt/screens/home_info_screen.dart';
import 'package:dtt/widget/icons_row.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    required this.home,
    super.key,
  });
  final HomeModel home;

  @override
  Widget build(BuildContext context) {
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
                      Text('${home.zip} ${home.city}',
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      IconsRow(
                        home: home,
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
