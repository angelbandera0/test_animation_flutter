import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animation5 extends StatefulWidget {
  const Animation5({super.key});
  @override
  State<Animation5> createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedPositionedExample(),
    );
  }
}


class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const ColoredBox(
                color: Colors.blue,
                child: Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}