import 'package:calorie_tracker/models/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealRow extends StatelessWidget {
  final Meal meal;

  const MealRow({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    var textColor = Colors.grey.shade800;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "${meal.consumedOnDisplay}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: textColor, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "${meal.caloriesQuantity.toString()} cal",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: textColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "${meal.details}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: textColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
