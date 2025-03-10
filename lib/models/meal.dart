import 'package:calorie_tracker/util.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Meal {
  late final String id;

  DateTime consumedOn;

  int caloriesQuantity;
  String details;

  Meal({
    String? id,
    required this.consumedOn, 
    required this.details, required this.caloriesQuantity
  }):  id = id ?? uuid.v4();

  String formatDateDisplay(DateTime date) {
    return formatDateTime(date);
  }

  String get consumedOnDisplay => formatDateDisplay(consumedOn);
}


int caloriesPerDate(DateTime date, List<Meal> meals) {
  Iterable<Meal> filteredCalories = meals.where((meal) => meal.consumedOn.day == date.day && meal.consumedOn.month == date.month && meal.consumedOn.year == date.year);
  return filteredCalories.fold<int>(0, (prev, next) => prev + next.caloriesQuantity);
}
