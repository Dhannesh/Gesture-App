import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum _Winner { none, likeUs, donate }

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    debugPrint('Rejecting gesture');
    acceptGesture(pointer);
  }
}

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  _Winner _winner = _Winner.none;
  final Border highlightBorder = Border.all(color: Colors.red, width: 5.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: RawGestureDetector(
              gestures: {
                AllowMultipleGestureRecognizer:
                    GestureRecognizerFactoryWithHandlers<
                            AllowMultipleGestureRecognizer>(
                        () => AllowMultipleGestureRecognizer(),
                        (AllowMultipleGestureRecognizer instance) {
                  instance.onTap = () {
                    debugPrint("*******LikeUs onTap*********");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Thank you for liking us!")));
                  };
                })
              },
              child: Container(
                width: 300,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: _winner == _Winner.likeUs ? highlightBorder : null,
                  color: Colors.orangeAccent,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Like Us'),
                    ),
                    RawGestureDetector(
                        gestures: {
                          AllowMultipleGestureRecognizer:
                              GestureRecognizerFactoryWithHandlers<
                                      AllowMultipleGestureRecognizer>(
                                  () => AllowMultipleGestureRecognizer(),
                                  (AllowMultipleGestureRecognizer instance) {
                            instance.onTap = () {
                              debugPrint("*******Donate onTap*********");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Thank you for donation!")));
                            };
                          })
                        },
                        child: Container(
                          width: 200,
                          height: 115,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: _winner == _Winner.donate
                                  ? highlightBorder
                                  : null,
                              color: Colors.greenAccent),
                          child: Text('Donate'),
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
