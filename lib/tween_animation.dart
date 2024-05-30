import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenState();
}

class _TweenState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text("Color"),
          First(),
          Text("Tranform"),
          Second(),
          Text("Third"),
          Third(),


        ],
      ),
    );
  }
}
class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(tween: ColorTween(begin: Colors.red,end: Colors.indigo),
        duration: const Duration(seconds: 3),
        builder: (context,value,child){
      return Container(
        height: 200,
        width: 200,
        color: value,
      );
        });
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0,end: 0.0),
        duration: Duration(seconds: 2),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.green,
        ),
        builder: (context,value,child){
          return Transform.translate(
            offset: Offset(0, -300*value),
            child: child,
          );});
  }

}
class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0,end: 0.0),
        duration: Duration(seconds: 1),
        child: FlutterLogo(size: 200,),
        builder: (context,value,child){
          return Transform.translate(
            offset: Offset(600*value, 0),
            child: child,
          );});
  }
  }




