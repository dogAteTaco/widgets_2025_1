import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFFE57373),
  Color(0xFFBA68C8),
  Color(0xFF64B5F6),
  Color(0xFF4DB6AC),
  Color(0xFF81C784),
  Color(0xFFFFD54F),
  Color(0xFFFFB74D),
  Color(0xFFA1887F),
  Color(0xFF90A4AE),
];

class AppTheme{
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 2, this.isDarkMode = true})
    : assert(selectedColor >= 0 && selectedColor < colorList.length,
      'selectedColor must be between 0 and ${colorList.length - 1}');

  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor], // Creates a color scheme based on the selected color
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: false // Avoid centering the title
    ),
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}){
    // Returns a new AppTheme instance with updated values based on the provided parameters
    // If the parameters are not provided, the original values are used
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}