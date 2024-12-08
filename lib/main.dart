import 'package:dtt/home_bloc/bloc/home_bloc.dart';
import 'package:dtt/widget/custom_theme_data.dart';
import 'package:flutter/material.dart';
import 'home_bloc/service/home_service.dart';
import 'package:dtt/screens/home_info_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dtt/screens/tabs_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.themeData,
      home: BlocProvider(
      create: (context) => HomeBloc(HomeService()),
      child:  TabsScreen(),
    ),
      routes: {
        HomeInfoScreen.routeName: (context) => HomeInfoScreen(),
      },
    );
  }
}
