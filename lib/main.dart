import 'package:flutter/material.dart';

import 'tracker.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Dream Diary Application",
      home: CaloriesTracker(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
      )
    ),
  );
}
