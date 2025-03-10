import 'package:calorie_tracker/models/meal.dart';
import 'package:calorie_tracker/util.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  final Meal meal;

  const MealDetail({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    "Состав: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    meal.details,
                    style: Theme.of(context).textTheme.titleLarge,
                  ))
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    "Съедено в: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    formatDateTime(meal.consumedOn),
                    style: Theme.of(context).textTheme.titleLarge,
                  ))
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    "Вес: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "${meal.caloriesQuantity.toString()} кал",
                    style: Theme.of(context).textTheme.titleLarge,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
