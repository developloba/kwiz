import 'package:flutter/material.dart';
import 'package:kwik/scaffold.dart';
import 'custom_widgets.dart';
import 'signin.dart';

void main() {
  runApp(MaterialApp(
    home: const Dash(),
    title: 'Kwiz',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue.shade900,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      secondaryHeaderColor: Colors.lightBlueAccent[200],
      fontFamily: 'Euclid',
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Pop',
              fontSize: 45,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          bodyText1:
              TextStyle(fontFamily: 'Pop', fontSize: 25, color: Colors.grey),
          bodyText2: TextStyle(
            fontFamily: 'Pop',
            fontSize: 25,
          )),
    ),
    darkTheme: ThemeData(
      primaryColor: Colors.blue.shade100,
      scaffoldBackgroundColor: const Color(0xFF0A0E21),
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      secondaryHeaderColor: Colors.blue,
      fontFamily: 'Euclid',
      textTheme: const TextTheme(
          bodyText1:
              TextStyle(fontFamily: 'Pop', fontSize: 25, color: Colors.white),
          headline1: TextStyle(
              fontFamily: 'Pop',
              fontSize: 45,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          bodyText2:
              TextStyle(fontFamily: 'Pop', fontSize: 25, color: Colors.grey)),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsetsDirectional.only(
                start: 120, top: 120, end: 120),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Welcome to ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontFamily: 'Euclid',
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'Kwiz',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 50,
                          ))
                    ])),
          ),
          Container(
              height: 425,
              width: 425,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/2.png')))),
          Button(
            width: 450,
            fill: Colors.blue.shade900,
          ),
          const SizedBox(
            height: 20,
          ),
          Button(
            width: 450,
            fill: Colors.transparent,
            outline: Colors.blue.shade900,
            label: 'Sign Up',
            labelcolor: Colors.blue.shade900,
            destination: const Signup(),
          )
        ],
      ),
    );
  }
}
