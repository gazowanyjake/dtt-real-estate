import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bloc/bloc/home_bloc.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('About'),
          centerTitle: false,
          titleTextStyle: Theme.of(context).textTheme.titleLarge),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design and Development',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/dtt_banner.png',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('by DTT',
                            style: Theme.of(context).textTheme.titleSmall),
                        GestureDetector(
                          onTap: () => context.read<HomeBloc>().add(LaunchUrlEvent(url: 'https://www.d-tt.nl/')),
                          child: Text(
                              'd-tt.nl',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
