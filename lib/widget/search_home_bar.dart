import 'package:dtt/home_bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHomeBar extends StatefulWidget {
  const SearchHomeBar({
    super.key,
  });

  @override
  State<SearchHomeBar> createState() => _SearchHomeBarState();
}

class _SearchHomeBarState extends State<SearchHomeBar> {
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        style: Theme.of(context).textTheme.titleSmall,
        onChanged: (value) => context.read<HomeBloc>().add(
              SearchHomeEvent(
                city: _searchController.text,
              ),
            ),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for a home',
          hintStyle: Theme.of(context).textTheme.headlineSmall,
          suffixIcon: _isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context.read<HomeBloc>().add(StopSearchingEvent());
                  },
                )
              : Icon(
                  Icons.search,
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
