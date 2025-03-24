import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/screens/cards/cards_screen.dart';
import 'package:widgets_app/screens/home/home_screen.dart';
import 'package:widgets_app/screens/progress/progress_screen.dart';
import 'package:widgets_app/screens/snackbar/snackbar_screen.dart';
import 'package:widgets_app/screens/theme_changer/theme_changer_screen.dart';

final List<RouteBase> routesList = [
  GoRoute(path: '/',name: HomeScreen.screenName, builder: (BuildContext context, GoRouterState state) => const HomeScreen()),
  GoRoute(path: '/theme', name: ThemeChangerScreen.screenName, builder: (BuildContext context, GoRouterState state) => const ThemeChangerScreen()),
  GoRoute(path: '/buttons', name: ButtonsScreen.screenName, builder: (BuildContext context, GoRouterState state) => const ButtonsScreen()),
  GoRoute(path: '/cards', name: CardsScreen.screenName, builder: (BuildContext context, GoRouterState state) => const CardsScreen()),
  GoRoute(path: '/progress', name: ProgressScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  ProgressScreen()),
  GoRoute(path: '/snackbar', name: SnackBarScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  SnackBarScreen()),
];