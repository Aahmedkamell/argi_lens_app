import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Timer',
        style: TextStyle(
            fontSize: 25
        ),
      ),
    );
  }
}
