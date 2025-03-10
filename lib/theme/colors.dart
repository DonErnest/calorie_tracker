import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color fillingBar;
  final Color barBackground;

  const CustomColors({
    required this.fillingBar,
    required this.barBackground,
  });

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      fillingBar: fillingBar ?? this.fillingBar,
      barBackground: barBackground ?? this.barBackground,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      fillingBar: fillingBar,
      barBackground: barBackground,
    );
  }
}
