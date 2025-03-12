import 'package:flutter/material.dart';

class GestureDetails extends StatefulWidget {
  const GestureDetails({super.key});

  @override
  State<GestureDetails> createState() => _GestureDetailsState();
}

class _GestureDetailsState extends State<GestureDetails> {
  String dragDirection = "None";
  int startingPointX = 0;
  int startingPointY = 0;
  int endingPointX = 0;
  int endingPointY = 0;
  int velocity = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        setState(() {
          dragDirection = "Horizontal";
          startingPointX = details.globalPosition.dx.round();
          startingPointY = details.globalPosition.dy.round();
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        setState(() {
          dragDirection = "Horizontal";
          endingPointX = details.globalPosition.dx.round();
          endingPointY = details.globalPosition.dy.round();
          velocity = details.velocity.pixelsPerSecond.dx.round();
        });
      },
      onVerticalDragStart: (DragStartDetails details) {
        setState(() {
          dragDirection = "Vertical";
          startingPointX = details.globalPosition.dx.round();
          startingPointY = details.globalPosition.dy.round();
        });
      },
      onVerticalDragEnd: (DragEndDetails details) {
        setState(() {
          dragDirection = "Vertical";
          endingPointX = details.globalPosition.dx.round();
          endingPointY = details.globalPosition.dy.round();
          velocity = details.velocity.pixelsPerSecond.dy.round();
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gesture details"),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient:
                  RadialGradient(colors: [Colors.white38, Colors.lightBlue])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                dragDirection,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                'Staring (X,Y): $startingPointX, $startingPointY',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Ending (X,Y): $endingPointX, $endingPointY',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Velocity: $velocity',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
