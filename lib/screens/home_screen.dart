import 'package:dtt/home_bloc/bloc/home_bloc.dart';
import 'package:dtt/widget/homes_list.dart';
import 'package:dtt/widget/search_home_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return  Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    'DTT REAL ESTATE',
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  titleSpacing: 16.0,
                  centerTitle: false,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchHomeBar(),
                    state.isSearching && state.searchList.isEmpty
                        ? Container(
                            padding: EdgeInsets.only(
                              top: 150,
                              left: 50,
                              right: 50,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/images/search_state_empty.png',
                                ),
                                Text(
                                  'No results found!',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'Perhaps try another search?',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                )
                              ],
                            ),
                          )
                        : Container(),
                    HomesList(
                        list: state.isSearching
                            ? state.searchList
                            : state.homesList),
                  ],
                ),
              );
      },
    );
  }
}
