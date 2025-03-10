import 'package:flutter/material.dart';
import 'package:gesture_app/detect_drags.dart';
import 'package:gesture_app/simple_gesture.dart';

// void main() => runApp(const SimpleGesture());

void main() => runApp(const MyStore());

class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Store',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blueGrey
      ),
      home: const DetectDrags(),
    );
  }
}