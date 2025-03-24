import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/appBars/app_bar_custom.dart';
import 'package:widgets_app/presentation/widgets/buttons/button_return_page.dart';

class ButtonsScreen extends StatelessWidget with AppBarCustom{
  static const String screenName = 'button_screen';

  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutReturnButton(title: 'Button Screen'),
      body: const _ButtonsView(),
      floatingActionButton: const ButtonReturnPage(),
    );
  }

}

class _ButtonsView extends StatelessWidget{
  const _ButtonsView();
  
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical:  20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){},child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Boton con onPressed null')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text('Elevated Button con icono')),
            FilledButton(onPressed: (){}, child: const Text('Filled Button')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.sunny), label: const Text('Filled Button con icono')),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined Button')),
            OutlinedButton.icon(onPressed: (){}, label: const Text('Outlined Button con icono'), icon: const Icon(Icons.wb_sunny_rounded)),
            TextButton(onPressed: (){}, child: const Text('Text Button')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.wb_sunny_rounded), label: const Text('Text Button con icono')),
            IconButton(onPressed: (){}, icon: const Icon(Icons.account_balance_outlined)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.account_balance_outlined), style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red),
              padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
            ),),
          ]
        ),
        ),
    );
  }
}