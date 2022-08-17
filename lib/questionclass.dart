import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Question {
  late String questionText;
  late bool questionAnswer;
  late double fontsize;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}

class Quizbrain {
  int questionnumber = 0;
  int responsenumber = 0;
  int score = 1;
  List<Question> questionbank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question(
      'It is illegal to pee in the Ocean in Portugal.',
      true,
    ),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Backrub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
    Question('Is the sky blue?', true),
    Question('Are you smart?', true),
    Question('Is a slugs blood Green?', true),
    Question('Air is pink', false)
  ];
  String getquestion() {
    return questionbank[questionnumber].questionText;
  }

  bool getanswer() {
    return questionbank[questionnumber].questionAnswer;
  }

  Object questionchange() {
    if (questionnumber < questionbank.length - 1) {
      return questionnumber++;
    } else if (questionnumber == questionbank.length) {
      return responsenumber = 1;
    } else {
      return 1;
    }
  }
}
