import 'package:dtt/home_bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      const String searchIcon = 'assets/icons/ic_search.svg';
    const String closeIcon = 'assets/icons/ic_close.svg';
    final Widget searchWidget = SvgPicture.asset(
      searchIcon,
      height: 30,
      color: Theme.of(context).textTheme.headlineSmall!.color,
    );
    final Widget closeWidget = SvgPicture.asset(
      closeIcon,
      height: 30,
    );
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
                  icon: closeWidget,
                  onPressed: () {
                    _searchController.clear();
                    context.read<HomeBloc>().add(StopSearchingEvent());
                  },
                )
              : searchWidget,
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
