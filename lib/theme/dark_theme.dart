import 'package:flutter/material.dart';

import 'colors.dart';


final darkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromRGBO(193, 41, 46, 1),
  dynamicSchemeVariant: DynamicSchemeVariant.expressive,
  brightness: Brightness.dark,
);
final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme().copyWith(
      foregroundColor: darkColorScheme.onPrimaryContainer,
      titleTextStyle: TextStyle(
          color: darkColorScheme.onPrimaryContainer
      ),
      toolbarTextStyle: TextStyle(color: darkColorScheme.onPrimaryContainer),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.onPrimaryContainer,
        foregroundColor: darkColorScheme.primaryContainer,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: darkColorScheme.onPrimaryContainer,
        foregroundColor: darkColorScheme.primaryContainer,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Color.fromRGBO(241, 233, 218, 1))
    ),
  extensions: [barsCustomColors]
);

final barsCustomColors = CustomColors(
  barBackground: Color.fromRGBO(217, 3, 104, 1),
  fillingBar: Color.fromRGBO(241, 233, 218, 1),
);