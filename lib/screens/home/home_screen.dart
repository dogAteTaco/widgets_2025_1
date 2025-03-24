import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/providers/widgets/sideMenu/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String screenName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Widgets de Material 3'),
        ),
        body: ListView.builder(
          itemCount: appMenuItems.length,
          itemBuilder: menuList,
        ),
        drawer: SideMenu(scaffoldKey: scaffoldKey)
        ,);
  }

  Widget? menuList(BuildContext context, int index) {
    final menuItem = appMenuItems[index];
    return _CustomListTitle(menuItem: menuItem);
  }
}

// Custom List Title for the menu items
class _CustomListTitle extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTitle({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () => context.push(menuItem.route), // Navigate to the route on tap
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
    );
  }
}
