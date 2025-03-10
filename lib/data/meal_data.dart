import 'dart:convert';
import 'dart:io';

import 'package:calorie_tracker/helpers/get_data_file_path.dart';
import 'package:calorie_tracker/models/meal.dart';



Future<void> saveMeals(List<Meal> meals) async {
  final filePath = await getDataFilePath("meals");
  final file = File(filePath);
  final mealsMaps = meals.map(
      (meal) => {
        'id': meal.id,
        'consumedOn': meal.consumedOn.toIso8601String(),
        'details': meal.details,
        'caloriesQuantity': meal.caloriesQuantity
    }
  ).toList();
  final mealsJson = jsonEncode(mealsMaps);
  await file.writeAsString(mealsJson);
}

Future<List<Meal>> loadMeals() async {
  try {
    final filePath = await getDataFilePath("meals");
    final file = File(filePath);
    final jsonContents = await file.readAsString();
    final mealsMaps = jsonDecode(jsonContents) as List<dynamic>;
    return mealsMaps.map(
            (mealMap) =>
            Meal(
                id: mealMap["id"],
                consumedOn: DateTime.parse(mealMap["consumedOn"]),
                details: mealMap["details"],
                caloriesQuantity: mealMap["caloriesQuantity"]
            )
    ).toList();
  } catch (error) {
    return [];
  }
}
