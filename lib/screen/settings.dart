import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  final int currentMaxCalories;
  final void Function(int newMax) onMaxUpdate;

  const SettingsScreen({super.key, required this.currentMaxCalories, required this.onMaxUpdate});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late int newMaxCalories;
  final newMaxCaloriesController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    newMaxCalories = widget.currentMaxCalories;
    newMaxCaloriesController.text = newMaxCalories.toString();
  }

  void onSaved() {
    widget.onMaxUpdate(newMaxCalories);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: newMaxCaloriesController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter(RegExp(r'^([1-9])\d*$'), allow: true)
            ],
            onChanged: (value) => setState(() => newMaxCalories = int.parse(value)),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: onSaved,
                child: const Text("Update"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
