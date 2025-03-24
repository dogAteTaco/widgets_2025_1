import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String route;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.route,
    required this.icon,
  });
}

List<MenuItem> appMenuItems = <MenuItem>[
  const MenuItem(title: 'Buttons', subTitle: 'Tipos de Botones', route: '/buttons', icon: Icons.smart_button_outlined),
  const MenuItem(title: 'Cards', subTitle: 'Tipos de Tarjetas', route: '/cards', icon: Icons.credit_card_outlined),
  const MenuItem(title: 'Progress Indicators', subTitle: 'Tipos de Indicadores de Progreso', route: '/progress', icon: Icons.hourglass_empty_outlined),
  const MenuItem(title: 'Snackbar y diálogos', subTitle: 'Tipos de Snackbar y diálogos', route: '/snackbar', icon: Icons.message_outlined),
  const MenuItem(title: 'Animated', subTitle: 'Tipos de Animaciones', route: '/animated', icon: Icons.animation_outlined),
  const MenuItem(title: 'UI Controls y Tiles', subTitle: 'Tipos de UI Controls y Tiles', route: '/ui_controls', icon: Icons.settings_outlined),
  const MenuItem(title: 'Intro/Tutorial', subTitle: 'Pantallas de Introducción', route: '/tutorial', icon: Icons.info_outline),
  const MenuItem(title: 'Infinite Scroll y Pull', subTitle: 'Tipos de Infinite Scroll y Pull', route: '/infinite_scroll', icon: Icons.arrow_circle_down_outlined),
  const MenuItem(title: 'Counter', subTitle: 'Contador.', route: '/counter', icon: Icons.numbers_outlined),
  const MenuItem(title: 'Theme Changer', subTitle: 'Cambio de tema de la aplicación', route: '/theme', icon: Icons.palette_outlined),
  
];