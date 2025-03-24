import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/screens/animated/animated_screen.dart';
import 'package:widgets_app/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/screens/cards/cards_screen.dart';
import 'package:widgets_app/screens/counter/counter_screen.dart';
import 'package:widgets_app/screens/home/home_screen.dart';
import 'package:widgets_app/screens/infinite_scroll/infinite_scroll_screen.dart';
import 'package:widgets_app/screens/progress/progress_screen.dart';
import 'package:widgets_app/screens/snackbar/snackbar_screen.dart';
import 'package:widgets_app/screens/theme_changer/theme_changer_screen.dart';
import 'package:widgets_app/screens/tutorial/tutorial_screen.dart';
import 'package:widgets_app/screens/ui_controls/ui_controls_screen.dart';

final List<RouteBase> routesList = [
  GoRoute(path: '/',name: HomeScreen.screenName, builder: (BuildContext context, GoRouterState state) => const HomeScreen()),
  GoRoute(path: '/theme', name: ThemeChangerScreen.screenName, builder: (BuildContext context, GoRouterState state) => const ThemeChangerScreen()),
  GoRoute(path: '/buttons', name: ButtonsScreen.screenName, builder: (BuildContext context, GoRouterState state) => const ButtonsScreen()),
  GoRoute(path: '/cards', name: CardsScreen.screenName, builder: (BuildContext context, GoRouterState state) => const CardsScreen()),
  GoRoute(path: '/progress', name: ProgressScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  ProgressScreen()),
  GoRoute(path: '/snackbar', name: SnackBarScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  SnackBarScreen()),
  GoRoute(path: '/animated', name: AnimatedScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  AnimatedScreen()),
  GoRoute(path: '/tutorial', name: TutorialScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  TutorialScreen()),
  GoRoute(path: '/infinite_scroll', name: InfiniteScrollScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  InfiniteScrollScreen()),
  GoRoute(path: '/counter', name: CounterScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  CounterScreen()),
  GoRoute(path: '/ui_controls', name: UiControlsScreen.screenName, builder: (BuildContext context, GoRouterState state) => const  UiControlsScreen()),
];