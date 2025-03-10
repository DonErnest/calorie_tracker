import 'package:calorie_tracker/theme/colors.dart';
import 'package:flutter/material.dart';


final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(193, 41, 46, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
);
final lightTheme = ThemeData.light().copyWith(
    colorScheme: lightColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      foregroundColor: lightColorScheme.onPrimaryContainer,
      titleTextStyle: TextStyle(
        color: lightColorScheme.onPrimaryContainer
      ),
      toolbarTextStyle: TextStyle(color: lightColorScheme.onPrimaryContainer),
      actionsIconTheme: IconThemeData(
        color: lightColorScheme.onPrimaryContainer
      )
  ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.onPrimaryContainer,
        foregroundColor: lightColorScheme.primaryContainer,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: lightColorScheme.onPrimaryContainer,
        foregroundColor: lightColorScheme.primaryContainer,
      ),
    ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.pink)
  ),
  extensions: [barsCustomColors],
);


final barsCustomColors = CustomColors(
  fillingBar: Color.fromRGBO(217, 3, 104, 1),
  barBackground: Color.fromRGBO(241, 233, 218, 1),
);
