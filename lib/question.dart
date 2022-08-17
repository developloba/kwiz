import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'questionclass.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class Quizbutton extends StatefulWidget {
  Quizbutton({
    Key? key,
    this.indicator = Colors.blue,
    required this.correctanswer,
    required this.label,
  }) : super(key: key);
  Color indicator;
  bool correctanswer;
  String label;

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
            if (widget.correctanswer == quizbrain.getanswer()) {
              widget.indicator = Colors.green;
            } else {
              widget.indicator = Colors.red;
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

// object instances of quizclas
final quizbrain = Quizbrain();
int responsenum = 0;
List<String> response = ['Next', 'Done'];

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/3.png',
                ),
                fit: BoxFit.fill)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: GlassmorphicContainer(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                borderRadius: 0,
                linearGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black12,
                      Colors.black12
                    ],
                    stops: [
                      0.3,
                      1,
                    ]),
                border: 0,
                blur: 70,
                borderGradient: const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.black12,
                      Colors.black26
                    ],
                    stops: [
                      0.06,
                      0.95,
                    ]),
              ),
            ),
            Positioned(
                top: 50,
                left: 30,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.blue[900],
                  ),
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                )),
            Positioned(
                top: 200,
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
                                  fontFamily: 'Pop', fontSize: 22)),
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
                                quizbrain.questionchange();
                              });
                            },
                            child: Text(
                              response[responsenum],
                              style: const TextStyle(
                                  fontSize: 25, fontFamily: 'Pop'),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
