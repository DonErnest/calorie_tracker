import 'package:calorie_tracker/data/destination.dart';
import 'package:calorie_tracker/data/meal_data.dart';
import 'package:calorie_tracker/models/meal.dart';
import 'package:calorie_tracker/screen/meal_history.dart';
import 'package:calorie_tracker/screen/meal_detail.dart';
import 'package:calorie_tracker/screen/meal_form.dart';
import 'package:calorie_tracker/screen/meal_stats.dart';
import 'package:flutter/material.dart';

class CaloriesTracker extends StatefulWidget {
  const CaloriesTracker({super.key});

  @override
  State<CaloriesTracker> createState() => _CaloriesTrackerState();
}

class _CaloriesTrackerState extends State<CaloriesTracker> {
  int maxCaloriesPerDay = 2000;
  List<Meal> userMeals = [];
  int currentScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final loadedDreams = await loadMeals();
    setState(() {
      userMeals = loadedDreams;
    });
  }

  void addMeal(Meal newDream) {
    setState(() {
      userMeals.add(newDream);
    });
    saveMeals(userMeals);
  }

  void removeMeal(Meal meal) {
    setState(() {
      userMeals.remove(meal);
    });
    saveMeals(userMeals);
  }

  void openAddMealSheet() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => Wrap(children: [
        MealForm(
          onMealAdded: addMeal,
        ),
      ]),
    );
  }

  void editMeal(Meal editedMeal) {
    setState(() {
      final idx = userMeals.indexWhere((sleep) => sleep.id == editedMeal.id);
      userMeals[idx] = editedMeal;
    });
    saveMeals(userMeals);
  }

  void openEditMealSheet(String id) {
    final existingSleep = userMeals.firstWhere((book) => book.id == id);

    showModalBottomSheet(
      context: context,
      builder: (ctx) => MealForm(
        onMealAdded: editMeal,
        existingMeal: existingSleep,
      ),
    );
  }

  void browseMeal(Meal selectedMeal) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => MealDetail(
        meal: selectedMeal,
      ),
    );
  }

  List<Destination> get destinations {
    return [
      Destination(
        screenTitle: Text(
          'Meals Stats',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        navLabel: 'Stats',
        icon: Icons.bar_chart_outlined,
        selectedIcon: Icons.bar_chart,
        appBarActions: [
          IconButton(
            onPressed: openAddMealSheet,
            icon: const Icon(Icons.add),
          )
        ],
        screen: MealStatsScreen(
          userMeals: userMeals,
          maxCalories: maxCaloriesPerDay,
        ),
      ),
      Destination(
        screenTitle: Text(
          'Meals consumed',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        navLabel: 'Calories Tracker',
        icon: Icons.receipt_long_outlined,
        selectedIcon: Icons.receipt_long,
        appBarActions: [
          IconButton(
            onPressed: openAddMealSheet,
            icon: const Icon(Icons.add),
          )
        ],
        screen: MainScreen(
          meals: userMeals,
          onRemove: removeMeal,
          onBrowse: browseMeal,
          onEdit: openEditMealSheet,
        ),
      ),
    ];
  }

  void updateCurrentPageIndex(int newIndex) {
    setState(() {
      currentScreenIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final destination = destinations[currentScreenIndex];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: destination.screenTitle,
          actions: destination.appBarActions,
        ),
        body: destination.screen,
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentScreenIndex,
          onDestinationSelected: updateCurrentPageIndex,
          destinations: destinations
              .map((destination) => NavigationDestination(
            icon: Icon(destination.icon),
            selectedIcon: Icon(destination.selectedIcon),
            label: destination.navLabel,
          ))
              .toList(),
        ),
      ),
    );
  }
}
