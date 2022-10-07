import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_stories/flutter_stories.dart';
import 'package:kwik/utils/quizback.dart';

class Flash extends StatefulWidget {
  const Flash({super.key});

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  @override
  Widget build(BuildContext context) {
    Color colortheme = Colormanger().randomcolortheme();
    Quizbrain questionbrain = Quizbrain();

    return Scaffold(
        backgroundColor: colortheme,
        body: Story(
          topOffset: 60,
          momentCount: questionbrain.questionbank.length - 1,
          momentDurationGetter: (index) {
            return const Duration(seconds: 30);
          },
          fullscreen: false,
          momentBuilder: (context, index) =>
              Stack(alignment: Alignment.center, children: [
            Positioned(
                top: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                      color: const Color.fromARGB(124, 217, 217, 217),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height),
                )),
            Positioned(
                top: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                      color: const Color.fromARGB(124, 217, 217, 217),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height),
                )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 450,
                    width: 450,
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                          elevation: 0,
                          color: colortheme.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                              width: 400,
                              height: 400,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    questionbrain.getquestionind(index),
                                    textAlign: TextAlign.center,
                                    style: (const TextStyle(
                                        color: Colors.white, fontSize: 25)),
                                  ),
                                ),
                              ))),
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}

class Colormanger {
  List<Color?> colors = [
    Colors.pink[300],
    Colors.green[300],
    Colors.blue[300],
    Colors.indigo[300],
    Colors.deepOrange[300],
  ];

  randomcolortheme() {
    final random = Random();
    var randomcolor = colors[random.nextInt(colors.length)];
    return randomcolor;
  }
}
