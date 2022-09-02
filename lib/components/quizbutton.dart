import 'package:flutter/material.dart';

import '../screens/quizfront.dart';

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
            backgroundColor: widget.indicator,
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
