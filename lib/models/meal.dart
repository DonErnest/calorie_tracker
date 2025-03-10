import 'package:flutter/material.dart';
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
    return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}';
  }

  String get consumedOnDisplay => formatDateDisplay(consumedOn);
}

String _zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

String formatDate(DateTime dateTime) {
  final day = _zeroPad(dateTime.day);
  final month = _zeroPad(dateTime.month);
  final year = dateTime.year;
  return '$day.$month.$year';
}

String formatTime(TimeOfDay dateTime) {
  final hour = _zeroPad(dateTime.hour);
  final minute = _zeroPad(dateTime.minute);

  return '$hour:$minute';
}

String formatDateTime(DateTime dateTime) {
  final day = _zeroPad(dateTime.day);
  final month = _zeroPad(dateTime.month);
  final year = dateTime.year;
  final hour = _zeroPad(dateTime.hour);
  final minute = _zeroPad(dateTime.minute);
  return '$day.$month.$year $hour:$minute';
}