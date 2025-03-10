import 'package:flutter/material.dart';
import 'package:gesture_app/product_details.dart';

class DetectDrags extends StatelessWidget {
  const DetectDrags({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        debugPrint(details.delta.toString());
        if (details.delta.direction > 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProductDetails(),
            ),
          );
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Product'),
          ),
          body: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/tie.jpg'), fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              Center(
                child: Text(
                  "Silk Twill Royal Blue Men's Tie",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 12,
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'View Details',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetails()),
                      );
                    },
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
