import 'package:flutter/material.dart';
import 'package:kwiz/custom.dart';
import 'package:kwiz/signin.dart';

void main() {
  runApp(MaterialApp(
      home: const Home(),
      title: 'Kwik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        secondaryHeaderColor: Colors.lightBlueAccent[200],
        fontFamily: 'Euclid',
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 32.0),
          headline1: TextStyle(fontSize: 40.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )));
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
            fill: Colors.blue.shade900,
          ),
          const SizedBox(
            height: 20,
          ),
          Button(
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
