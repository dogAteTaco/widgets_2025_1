import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/screens/home/home_screen.dart';

final List<RouteBase> routesList = [
  GoRoute(
    path: '/',
    name: HomeScreen.screenName,
    builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
  ),
  ];