import 'package:flutter/material.dart';
import 'package:sir_task_8/navigation_service/route_constants.dart';

import 'navigation_service/navigation_service.dart';
import './navigation_service/route_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NavigationService().navigationKey,
      home: RouteService.routes[RouteConstants.myHomePage],
    );
  }
}
