import 'package:flutter/material.dart';

import 'custom.dart';
import 'dash.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 80,
            right: 80,
          ),
          child: SizedBox(
            height: 120,
            width: 400,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Create your brand new account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'Euclid',
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " here",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 40,
                        fontFamily: 'Euclid',
                        fontWeight: FontWeight.bold),
                  )
                ])),
          ),
        ),
        const Txtfield1(
          text: 'Firstname',
          pad: 0,
          top: 20,
          side: 30,
        ),
        const Txtfield1(
          text: 'Lastname',
          pad: 0,
          top: 20,
          side: 30,
        ),
        const Txtfield1(
          pad: 0,
          top: 20,
          side: 30,
        ),
        const PasswordField(
          pad: 0,
          top: 20,
          side: 30,
        ),
        const PasswordField(
          pad: 0,
          top: 20,
          side: 30,
          text: 'Confirm Password',
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Button(
            fill: Colors.blue.shade900,
            label: 'Sign up',
            destination: const Dash(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: 400,
            height: 75,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                        side:
                            BorderSide(color: Colors.blue.shade900, width: 3))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 33,
                      width: 33,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/google.png'))),
                    ),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                          fontFamily: 'Euclid',
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ),
      ]),
    );
  }
}
