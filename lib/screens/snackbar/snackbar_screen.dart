import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/appBars/app_bar_custom.dart';
import 'package:widgets_app/presentation/widgets/snackbar/snackbar_custom.dart';

class SnackBarScreen extends StatelessWidget
    with AppBarCustom, CustomSnackBars {
  static const screenName = 'snackbar_screen';
  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Snackbars y Diálogos'),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => toShowSnackBarCustom(context,
              snackBarContent: const Text('Snackbar message')),
          label: const Text('Show SnackBar'),
          icon: const Icon(Icons.remove_done)),
      body: const Center(child: _ShowButtonsList()),
    );
  }
}

class _ShowButtonsList extends StatelessWidget {
  const _ShowButtonsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilledButton.tonal(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    'The tower, which was not supposed to be there, plunges into the earth in a place just before the black pine forest begins to give way to swamp and then the reeds and wind-gnarled trees of the marsh flats. Beyond the marsh flats and the natural canals lies the ocean and, a little farther down the coast, a derelict lighthouse. All of this part of the country had been abandoned for decades, for reasons that are not easy to relate. Our expedition was the first to enter Area X for more than two years, and much of our predecessors\' equipment had rusted, their tents and sheds little more than husks. Looking out over that untroubled landscape, I do not believe any of us could yet see the threat..')
              ]);
            },
            child: const Text('Licencias usadas')),
        FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar Diálogo'))
      ],
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('¿Estas Seguro?'),
              content: const Text(
                  'The tower, which was not supposed to be there, plunges into the earth in a place just before the black pine forest begins to give way to swamp and then the reeds and wind-gnarled trees of the marsh flats. Beyond the marsh flats and the natural canals lies the ocean and, a little farther down the coast, a derelict lighthouse. All of this part of the country had been abandoned for decades, for reasons that are not easy to relate. Our expedition was the first to enter Area X for more than two years, and much of our predecessors\' equipment had rusted, their tents and sheds little more than husks. Looking out over that untroubled landscape, I do not believe any of us could yet see the threat.'),
              actions: [
                TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
                FilledButton( onPressed: () => context.pop(), child: const Text('Aceptar'))
              ],
            ));
  }
}
