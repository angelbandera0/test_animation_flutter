import 'dart:math';

import 'package:flutter/material.dart';

class TransformView extends StatefulWidget {
  const TransformView({super.key});

  @override
  State<TransformView> createState() => _TransformViewState();
}

class _TransformViewState extends State<TransformView> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Transform.scale(
            scale: sliderValue*1.5,
            child: FlutterLogo(size: 50,),
          ),
          Transform.translate(
            offset: Offset(0, 100*sliderValue),
            child: Opacity(
              opacity: 1-sliderValue,
                child: FlutterLogo(size: 50,)),
          ),


          Slider(value: sliderValue, onChanged: (value){
                setState(() {
                  sliderValue=value;

                });
          }),
      Text("Value: $sliderValue",style: TextStyle(color: Colors.black,fontSize: 20),),
          Transform.rotate(
            angle: pi*sliderValue,
            child: FlutterLogo(size: 50,),
          ),
          Transform(
            transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
              //..rotateX(pi*sliderValue)
              ..rotateY(pi*sliderValue)
             // ..rotateZ(pi*sliderValue)
            ,
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height: 150,
                color: Colors.green,
                child: Center(child: FlutterLogo(size: 50,))),
          ),
          
        ],
      ),
    );
  }
}





