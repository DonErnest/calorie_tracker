import 'package:calorie_tracker/theme/colors.dart';
import 'package:flutter/material.dart';

class RatioBar extends StatelessWidget {
  final int maxPerDay;
  final int currentAmount;

  const RatioBar({Key? key, required this.maxPerDay, required this.currentAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customBarColor = Theme.of(context).extension<CustomColors>()!;
    double lineProgress = 200;
    List<Widget> widgets = [
      // Background bar
      Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: customBarColor.barBackground,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      // Foreground bar based on ratio
      Container(
        height: 40,
        width: lineProgress, // Adjust width based on ratio
        decoration: BoxDecoration(
          color: customBarColor.fillingBar,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ];

    if (currentAmount < maxPerDay ) {
      lineProgress = 200 * currentAmount / maxPerDay;
    } else {
      widgets.add(
        Positioned(
          left: maxPerDay * 200 / currentAmount, // Position at the right of the filled bar
          child: Container(
            width: 200 - maxPerDay * 200 / currentAmount, // Vertical line width
            height: 40, // Full height of the bar
            decoration: BoxDecoration(
              color: Color.fromRGBO(241, 211, 2, 1),
              borderRadius: BorderRadius.circular(10),
            ),// Color of th
            alignment: Alignment.center,
            child: Text(
                "Stop",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20
              ),
            ),// e vertical line
          ),
        ),
      );
    }
    return Stack(
      children: widgets,
      alignment: AlignmentDirectional.centerStart,
    );
  }
}

