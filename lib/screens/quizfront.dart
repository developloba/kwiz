import 'dart:ui';

import 'package:flutter/material.dart';

import 'quizback.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class Quizbutton extends StatefulWidget {
  Quizbutton(
      {Key? key,
      this.indicator = const Color.fromARGB(255, 0, 221, 233),
      required this.correctanswer,
      required this.label,
      this.tried = false})
      : super(key: key);
  Color indicator;
  bool correctanswer;
  String label;
  bool tried;

  @override
  State<Quizbutton> createState() => _QuizbuttonState();
  final quiz = const Quiz();
}

class _QuizbuttonState extends State<Quizbutton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            primary: widget.indicator,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: const Size(295, 75),
            side: const BorderSide(color: Colors.transparent)),
        onPressed: () {
          setState(() {
            if (widget.correctanswer == quizbrain.getanswer() &&
                widget.tried == false) {
              widget.indicator = Colors.green;
              quizbrain.score++;
            } else {
              widget.indicator = Colors.red;
              widget.tried = true;
            }
          });
        },
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

// object instances of quizclass
final quizbrain = Quizbrain();
int responsenum = 0;
List<String> response = ['Next', 'Done'];
double result = quizbrain.score / quizbrain.questionbank.length * 100;

class _QuizState extends State<Quiz> {
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
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: SizedBox(
                        width: 200,
                        child: Text(quizbrain.getquestion(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Pop',
                                fontSize: 22,
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
                                        const SizedBox(
                                          width: 300,
                                          child: Text(
                                            "Congratulations",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.red),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const SizedBox(
                                              width: 300,
                                              child: Text(
                                                "You've reached the end of the quiz",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 25),
                                              ),
                                            ),
                                            const Text("You've scored",
                                                style: TextStyle(fontSize: 24)),
                                            Text("$result",
                                                style: const TextStyle(
                                                    fontSize: 45,
                                                    color: Colors.green)),
                                          ],
                                        ),
                                        const Text('Greatjob!',
                                            style: TextStyle(
                                              fontSize: 25,
                                            )),
                                      ],
                                    ),
                                  ),
                                  buttons: [
                                    DialogButton(
                                      radius: BorderRadius.circular(25),
                                      onPressed: () {
                                        setState(() {
                                          quizbrain.restart();
                                          quizbrain.restartscore();
                                        });
                                      },
                                      width: 120,
                                      child: const Text(
                                        "Restart",
                                        style: TextStyle(
                                            fontFamily: 'Pop',
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    )
                                  ],
                                ).show();
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
