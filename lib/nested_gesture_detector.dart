import 'package:flutter/material.dart';

enum _Winner { none, inner, outer }

class NestedGestureDetector extends StatefulWidget {
  const NestedGestureDetector({super.key});

  @override
  State<NestedGestureDetector> createState() => _NestedGestureDetectorState();
}

class _NestedGestureDetectorState extends State<NestedGestureDetector> {
  _Winner _winner = _Winner.none;
  final Border highlightBorder = Border.all(color: Colors.red, width: 8.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    debugPrint('Outer onTap');
                    setState(() {
                      _winner = _Winner.outer;
                    });
                  },
                  onTapDown: (_) => debugPrint('Outer onTapDown'),
                  onTapCancel: () => debugPrint('Outer onTapCancel'),
                  child: Container(
                      width: 300,
                      height: 300,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border:
                              _winner == _Winner.outer ? highlightBorder : null,
                          color: Colors.orangeAccent),
                      child: GestureDetector(
                          onTap: () {
                            debugPrint('Inner onTap');
                            setState(() {
                              _winner = _Winner.inner;
                            });
                          },
                          onTapDown: (_) => debugPrint('Inner onTapDown'),
                          onTapCancel: () => debugPrint('Inner onTapCancel'),
                          child: Container(
                            width: 200,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: _winner == _Winner.inner
                                    ? highlightBorder
                                    : null,
                                color: Colors.blueAccent),
                          )))),
            )
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan) ,
                child: Text('Reset',),

                onPressed: () {
                  setState(() {
                    _winner = _Winner.none;
                  });
                },
              )
              )
            ],
          ),
        )
      ],
    );
  }
}
