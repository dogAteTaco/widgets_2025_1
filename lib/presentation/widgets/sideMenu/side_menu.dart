import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index) {
        // Index is clearer than generic 'value' name
        navigateToDestination(index);
      },
      children: [
        ...mainWidgets(hasNotch), // Witgets from the Principal section
        ...secondaryWidgets() // Widgets from the Otras Opciones section
      ],
    );
  }

  List<Widget> mainWidgets(bool hasNotch) {
    return [
      Padding(
        padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
        child: const Text('Principales'),
      ),
      ...appMenuItems.sublist(0, 3).map( // Gets the first 3 items from the menu
            (item) => NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.title),
            ),
          ),
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
        child: Divider(),
      ),
    ];
  }

  List<Widget> secondaryWidgets() {
    return [
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
        child: Text('Secundarios'),
      ),
      ...appMenuItems.sublist(3).map( // Gets the items from the menu starting from the 4th
            (item) => NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.title),
            ),
          ),
    ];
  }

  void navigateToDestination(index) {
    setState(() {
      navDrawerIndex = index;
    });

    final menuItem = appMenuItems[index];
    context.push(menuItem.route);
    widget.scaffoldKey.currentState?.openEndDrawer();
  }
}
