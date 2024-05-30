import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animation6 extends StatefulWidget {
  const Animation6({super.key});
  @override
  State<Animation6> createState() => _Animation6State();
}

class _Animation6State extends State<Animation6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedSizeExample(),
    );
  }
}

class AnimatedSizeExample extends StatefulWidget {
  const AnimatedSizeExample({super.key});

  @override
  State<AnimatedSizeExample> createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: ColoredBox(
        color: Colors.amberAccent,
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          child: FlutterLogo(size: _size),
        ),
      ),
    );
  }
}