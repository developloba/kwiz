import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/quizbutton.dart';

import 'quizback.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

final quizbrain = Quizbrain();
var numb = quizbrain.questionnumber + 1;
int responsenum = 0;
List<String> response = ['Next', 'Done'];
double result = quizbrain.score / quizbrain.questionbank.length * 100;

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  late AnimationController controls;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                    color: const Color.fromARGB(124, 217, 217, 217),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height),
              )),
          Positioned(
              top: 50,
              left: 30,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey.shade700,
                ),
                onPressed: (() {
                  Navigator.pop(context);
                }),
              )),
          Positioned(
              top: 140,
              child: Container(
                width: 400,
                height: 650,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Question $numb',
                        style: heading2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: SizedBox(
                        width: 200,
                        child: Text(quizbrain.getquestion(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Pop',
                                fontSize: 20,
                                color: Colors.black)),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Quizbutton(
                      correctanswer: true,
                      label: 'True',
                    ),
                    Quizbutton(
                      correctanswer: false,
                      label: 'False',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (quizbrain.questionnumber ==
                                  quizbrain.questionbank.length - 1) {
                                controls = AnimationController(
                                    upperBound: result,
                                    vsync: this,
                                    duration: const Duration(seconds: 1));
                                controls.forward();

                                Alert(
                                    style: AlertStyle(
                                      animationType: AnimationType.shrink,
                                      isCloseButton: false,
                                      isOverlayTapDismiss: true,
                                      descStyle: const TextStyle(),
                                      descTextAlign: TextAlign.center,
                                      animationDuration:
                                          const Duration(milliseconds: 600),
                                      alertBorder: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(80),
                                      ),
                                      titleStyle: const TextStyle(
                                          color: Colors.red, fontSize: 30),
                                      alertAlignment: Alignment.center,
                                    ),
                                    context: context,
                                    content: SizedBox(
                                      width: 320,
                                      height: 500,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'You scored',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 7,
                                                    color: Colors.amber),
                                                shape: BoxShape.circle),
                                            child: AnimatedBuilder(
                                              animation: controls,
                                              builder: (context, child) {
                                                return Text(
                                                  '${controls.value.toInt()}%',
                                                  style: const TextStyle(
                                                      fontSize: 40,
                                                      color: Colors.amber),
                                                );
                                              },
                                            ),
                                          ),
                                          const Text(
                                            "That's higher than 40% of our users",
                                            style: TextStyle(fontSize: 30),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: 120,
                                            height: 60,
                                            child: DialogButton(
                                              radius: BorderRadius.circular(25),
                                              onPressed: () {
                                                setState(() {
                                                  quizbrain.restart();
                                                  quizbrain.restartscore();
                                                  Navigator.pop(context);
                                                });
                                              },
                                              width: 120,
                                              color: Colors.green,
                                              child: const Text(
                                                "Done",
                                                style: TextStyle(
                                                    fontFamily: 'Pop',
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    buttons: []).show();
                              } else {
                                quizbrain.questionchange();
                              }
                            });
                          },
                          child: Text(
                            response[responsenum],
                            style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'Pop',
                                color: Color.fromARGB(255, 4, 159, 167)),
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
