import 'package:flutter/material.dart';
import 'implicit/animation1.dart';
import 'implicit/animation10.dart';
import 'implicit/animation11.dart';
import 'implicit/animation12.dart';
import 'implicit/animation13.dart';
import 'implicit/animation14.dart';
import 'implicit/animation2.dart';
import 'implicit/animation3.dart';
import 'implicit/animation4.dart';
import 'implicit/animation5.dart';
import 'implicit/animation6.dart';
import 'implicit/animation7.dart';
import 'implicit/animation8.dart';
import 'implicit/animation9.dart';

class ImplictAnimation extends StatelessWidget {
  const ImplictAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("ImplictAnimation"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AnimatedAlignExample();
                }));
              }, child: Text("AnimatedAling")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation2();
                }));
              }, child: Text("AnimatedBUilder")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation3();
                }));
              }, child: Text("AnimatedContainer")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AnimatedListSample();
                }));
              }, child: Text("AnimatedList")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation5();
                }));
              }, child: Text("AnimatedPositioned")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation6();
                }));
              }, child: Text("AnimatedSize")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation7();
                }));
              }, child: Text("AnimatedWidgetExample")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation8();
                }));
              }, child: Text("DecoratedBoxTransition ")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation9();
                }));
              }, child: Text("FadeTransition ")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation10();
                }));
              }, child: Text("HeroExample")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation11();
                }));
              }, child: Text("PositionedTransitionExample")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation12();
                }));
              }, child: Text("RotationTransitionExample")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation13();
                }));
              }, child: Text("ScaleTransitionExample")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Animation14();
                }));
              }, child: Text("SizeTransitionExample")),

            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
