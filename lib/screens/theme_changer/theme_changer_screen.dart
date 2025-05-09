import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget{
  static const screenName = 'theme_changer';

  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Tema'),
        actions: [
          IconButton(icon: Icon(
            isDarkMode? Icons.dark_mode_outlined : Icons.light_mode_outlined
          ),
          onPressed: (){
            ref.read(themeNotifierProvider.notifier).toggleDarkMode();
          },)
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget{
  const _ThemeChangerView();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor  ;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Color', style: TextStyle(color: color)),
          subtitle: Text(color.toString()),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (index){
            ref.watch(themeNotifierProvider.notifier).changeColor(index!);
          },
        );
      },
    );
  }
}