import 'package:calorie_tracker/models/meal.dart';
import 'package:calorie_tracker/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MealForm extends StatefulWidget {
  final Meal? existingMeal;
  final void Function(Meal meal) onMealAdded;

  const MealForm({super.key, required this.onMealAdded, this.existingMeal});

  @override
  State<MealForm> createState() => _MealFormState();
}

class _MealFormState extends State<MealForm> {
  var mealDetails = "";
  final detailsController = TextEditingController();

  int selectedCaloriesQuantity = 0;
  final caloriesQuantityController = TextEditingController();

  DateTime? selectedConsumedOnDate;
  final selectedConsumedOnDateController = TextEditingController();

  TimeOfDay? selectedConsumedOnTime;
  final selectedConsumedOnTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.existingMeal != null) {
      final existingSleep = widget.existingMeal!;

      detailsController.text = existingSleep.details;
      mealDetails = existingSleep.details;

      selectedCaloriesQuantity = existingSleep.caloriesQuantity;
      caloriesQuantityController.text = existingSleep.caloriesQuantity.toString();

      selectedConsumedOnDateController.text = formatDate(existingSleep.consumedOn);
      selectedConsumedOnDate = existingSleep.consumedOn;

      selectedConsumedOnTimeController.text =
          formatTime(TimeOfDay.fromDateTime(existingSleep.consumedOn));
      selectedConsumedOnTime = TimeOfDay.fromDateTime(existingSleep.consumedOn);
    }
    ;

    if (selectedConsumedOnDate != null) {
      selectedConsumedOnDateController.text = formatDate(selectedConsumedOnDate!);
      selectedConsumedOnTimeController.text = formatTime(selectedConsumedOnTime!);
    }
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    setState(() {
      if (mealDetails == "" ||
          selectedConsumedOnTime == null ||
          selectedConsumedOnDate == null ||
          selectedCaloriesQuantity == 0) {
        return;
      }

      DateTime consumedOnDateTime = DateTime(
        selectedConsumedOnDate!.year,
        selectedConsumedOnDate!.month,
        selectedConsumedOnDate!.day,
        selectedConsumedOnTime!.hour,
        selectedConsumedOnTime!.minute,
      );
      
      final meal = Meal(
          id: widget.existingMeal?.id,
          details: detailsController.text.trim(),
          consumedOn: consumedOnDateTime,
          caloriesQuantity: selectedCaloriesQuantity
      );
      widget.onMealAdded(meal);
      Navigator.pop(context);
    });
  }

  void onStartDateTap() async {
    final now = DateTime.now();
    var lastDate = now;
    var firstDate = now.subtract(Duration(days: 365));

    final dateFromUser = await showDatePicker(
      context: context,
      initialDate: selectedConsumedOnDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (dateFromUser != null) {
      setState(() {
        selectedConsumedOnDate = dateFromUser;
        selectedConsumedOnDateController.text = formatDate(dateFromUser);
      });
    }
  }
  
  void onConsumedOnTimeTap() async {
    var initialTime = TimeOfDay.now();

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      setState(() {
        selectedConsumedOnTime = pickedTime;
        selectedConsumedOnTimeController.text = formatTime(pickedTime);
      });
    }
  }

  @override
  void dispose() {
    detailsController.dispose();
    caloriesQuantityController.dispose();
    selectedConsumedOnDateController.dispose();
    selectedConsumedOnTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: detailsController,
              onChanged: (value) => setState(() => mealDetails = value),
              maxLines: 3,
              decoration: const InputDecoration(
                label: Text("enter meal description"),
              ),
            ),
            TextField(
              controller: caloriesQuantityController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(RegExp(r'^([1-9])\d*$'), allow: true)
              ],
              onChanged: (value) => setState(() => selectedCaloriesQuantity = int.parse(value)),
              decoration: const InputDecoration(
                label: Text("enter calories amount"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: onStartDateTap,
                    readOnly: true,
                    controller: selectedConsumedOnDateController,
                    decoration: InputDecoration(
                      label: Text('enter consumption date'),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child: TextField(
                    onTap: onConsumedOnTimeTap,
                    readOnly: true,
                    controller: selectedConsumedOnTimeController,
                    decoration: InputDecoration(
                      label: Text('enter consumption time'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: onCanceled, child: Text('Cancel')),
                const Spacer(),
                ElevatedButton(
                  onPressed: onSaved,
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
