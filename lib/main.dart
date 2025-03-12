import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gesture_app/about_us.dart';
import 'package:gesture_app/detect_drags.dart';
import 'package:gesture_app/gesture_details.dart';
import 'package:gesture_app/product_view.dart';
import 'package:gesture_app/simple_gesture.dart';

import 'nested_gesture_detector.dart';

// void main() => runApp(const SimpleGesture());

void main() {
  debugPrintGestureArenaDiagnostics = true;
  runApp(const MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Store',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.cyan
      ),
      // home: const DetectDrags(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Insta Store Animal Rescue"),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
        ),
        // body: ProductView(),
        // body: NestedGestureDetector(),
        body: AboutUs(),
      ),
    );
  }
}