import 'package:calorie_tracker/theme/dark_theme.dart';
import 'package:calorie_tracker/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'tracker.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Dream Diary Application",
      home: CaloriesTracker(),
      theme: lightTheme,
      darkTheme: darkTheme,
    ),
  );
}
