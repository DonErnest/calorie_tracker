import 'package:calorie_tracker/models/meal.dart';
import 'package:calorie_tracker/util.dart';
import 'package:calorie_tracker/widgets/bar_chart.dart';
import 'package:calorie_tracker/widgets/line_bar.dart';
import 'package:flutter/material.dart';

class MealStatsScreen extends StatelessWidget {
  final List<Meal> userMeals;
  final int maxCalories;

  const MealStatsScreen({
    super.key,
    required this.userMeals,
    required this.maxCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Потребление калорий на ${formatDate(DateTime.now())}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 20),
          Text(
            "${caloriesPerDate(DateTime.now(), userMeals)} / ${maxCalories}",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          LineBar(),
          SizedBox(child: MealsBarChart(meals: userMeals)),
        ],
      ),
    );
  }
}
