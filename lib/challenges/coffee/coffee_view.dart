import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/challenges/coffee/coffee_list.dart';

class CoffeeView extends StatefulWidget {
  const CoffeeView({super.key});

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  final list = CoffeeListGenerator().generate();
  late PageController controller = PageController(viewportFraction: 0.35);
  late PageController namecontroller = PageController();
  double currentPage = 0.0;
  double textPage = 0.0;

  _onPageChange() {
    setState(() {
      currentPage = controller.page ?? 00;
    });
  }

  _onNameChange() {
    setState(() {
      textPage = namecontroller.page ?? 00;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    controller.addListener(_onPageChange);
    namecontroller.addListener(_onNameChange);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_onPageChange);
    namecontroller.removeListener(_onNameChange);
    controller.dispose();
    namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          //background(),
          Positioned(
              left: 20,
              right: 20,
              bottom: -size.height * 0.22,
              height: size.height * 0.3,
              child: DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Colors.brown, blurRadius: 90, spreadRadius: 45)
                ]),
              )),

          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: controller,
                itemCount: list.length + 1,
                onPageChanged: (value) {
                  if (value < list.length) {
                    namecontroller.animateToPage(value,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox.shrink();
                  }
                  double result = currentPage - index + 1;
                  double value = -0.4 * result + 1;
                  double opacity = value.clamp(0.0, 1.0);
                  print("${list[index - 1].url}: $value");
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(0.0, size.height / 2.8 * (1 - value).abs())
                        ..scale(max(0.0, value)),
                      child: Opacity(
                          opacity: opacity,
                          child: Image.asset(
                              fit: BoxFit.fitHeight, list[index - 1].url)),
                    ),
                  );
                }),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView.builder(
                        controller: namecontroller,
                        itemCount: list.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          double opacity =
                              (1 - (index - textPage).abs()).clamp(0.0, 1.0);

                          return Opacity(
                              opacity: opacity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.2),
                                child: Text(
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 25),
                                    list[min(currentPage.toInt(), list.length - 1)].name),
                              ));
                        }),
                  ),
                  //SizedBox(height: 10,),
                  AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      key: Key(
                          list[min(currentPage.toInt(), list.length - 1)].name),
                      child: Text(
                        list[min(currentPage.toInt(), list.length - 1)]
                            .price
                            .toStringAsFixed(2),
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),
                      ))
                ],
              )),
        ],
      ),
    );
  }

  background() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffBD8A3E), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
