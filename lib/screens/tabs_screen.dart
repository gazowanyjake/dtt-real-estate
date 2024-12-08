import 'package:dtt/home_bloc/service/home_service.dart';
import 'package:flutter/material.dart';

import 'package:dtt/screens/home_screen.dart';
import 'package:dtt/screens/info_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bloc/bloc/home_bloc.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const routeName = '/tabs-screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _screens = <Widget>[
    HomeScreen(),
    InfoScreen(),
  ];

  @override
  void initState() {
    context.read<HomeBloc>().add(GetUserPositionEvent());
    context.read<HomeBloc>().add(GetHomesEvent());
    super.initState();
  }

  late int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isLoading
            ? Scaffold(
                backgroundColor: Theme.of(context).colorScheme.surface,
                body: Center(
                  child: Image(
                    image: AssetImage(
                      'assets/images/launcher_icon.png',
                    ),
                  ),
                ),
              )
            : Scaffold(
                body: _screens[_selectedTabIndex],
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor:
                      Theme.of(context).textTheme.titleLarge!.color,
                  unselectedItemColor: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onTap: _selectTab,
                  currentIndex: _selectedTabIndex,
                  items: const [
                    BottomNavigationBarItem(
                      label: '',
                      icon: Icon(
                        Icons.home,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: Icon(
                        Icons.info,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
