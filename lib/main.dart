import 'package:flutter/material.dart';
import 'package:metro_ui/features/metro_navigation/domain/services/metro_network.dart';
import 'package:metro_ui/features/metro_navigation/domain/services/trip_planner.dart';
import 'package:metro_ui/features/metro_navigation/presentation/screens/home_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final network = MetroNetwork.official();
    final planner = TripPlanner(network: network);

    return MaterialApp(
      title: 'Cairo Metro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: HomeScreen(network: network, planner: planner),
    );
  }
}
