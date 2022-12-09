import 'package:flutter/material.dart';

class DailyStreakTile extends StatelessWidget {
  const DailyStreakTile({super.key, required this.dailyStreak});

  final int dailyStreak;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.local_fire_department_rounded,
          color: Colors.deepOrange, size: 50),
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Text(dailyStreak.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.deepOrange)),
      ),
    ]);
  }
}