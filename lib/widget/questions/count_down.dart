import 'package:flutter/material.dart';
import 'package:flutter_study_project/configs/themes/custom_text_styles.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key, this.color, required this.timer});
  final Color? color;
  final String timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timer, color: color ?? Theme.of(context).primaryColor),
        const SizedBox(
          width: 5,
        ),
        Text(
          timer,
          style: countDownTimerTS().copyWith(color: color),
        )
      ],
    );
  }
}
