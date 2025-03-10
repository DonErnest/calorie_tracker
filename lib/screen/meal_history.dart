import 'package:calorie_tracker/models/meal.dart';
import 'package:calorie_tracker/widgets/meal_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MainScreen extends StatelessWidget {
  final List<Meal> meals;
  final void Function(Meal meal) onBrowse;
  final void Function(String id) onEdit;
  final void Function(Meal meal) onRemove;

  const MainScreen(
      {super.key,
      required this.meals,
      required this.onBrowse,
      required this.onEdit,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemBuilder: (ctx, idx) {
        final dream = meals[idx];
        return GestureDetector(
          onTap: () => {onBrowse(dream)},
          child: Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) => onRemove(dream),
                    icon: Icons.delete,
                    backgroundColor: theme.colorScheme.error.withAlpha(220),
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (ctx) {onEdit(dream.id);},
                    icon: Icons.edit,
                    backgroundColor: theme.colorScheme.secondary.withAlpha(220),
                    label: 'Edit',
                  ),
                ],
              ),
              child: MealRow(meal: dream)),
        );
      },
      itemCount: meals.length,
    );
  }
}
