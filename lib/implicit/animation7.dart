import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animation7 extends StatefulWidget {
  const Animation7({super.key});
  @override
  State<Animation7> createState() => _Animation7State();
}

class _Animation7State extends State<Animation7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedWidgetExample(),
    );
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    super.key,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(width: 200.0, height: 200.0, color: Colors.green),
    );
  }
}

class AnimatedWidgetExample extends StatefulWidget {
  const AnimatedWidgetExample({super.key});

  @override
  State<AnimatedWidgetExample> createState() => _AnimatedWidgetExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpinningContainer(controller: _controller);
  }
}