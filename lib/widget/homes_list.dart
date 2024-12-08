import 'package:dtt/model/home_model.dart';
import 'package:dtt/widget/home_tile.dart';
import 'package:flutter/material.dart';

class HomesList extends StatelessWidget {
  final List<HomeModel> list;
  const HomesList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return HomeTile(
            home: list[index],
          );
        },
      ),
    );
  }
}
