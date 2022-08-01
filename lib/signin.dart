import 'package:flutter/material.dart';
import 'package:kwiz/dash.dart';
import 'package:kwiz/main.dart';
import 'custom.dart';

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
        const Padding(
          padding: EdgeInsets.only(top: 100, left: 150, right: 150, bottom: 50),
          child: SizedBox(
            height: 150,
            width: 300,
            child: Text(
              "We are so glad to have you here",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Euclid',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Txtfield1(
          text: 'Firstname',
        ),
        const Txtfield1(
          text: 'Lastname',
        ),
        const Txtfield1(),
        const PasswordField(),
        const PasswordField(
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
        const Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            width: 100,
            child: Text(
              'Or',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Euclid', color: Colors.grey, fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Button(
            outline: Colors.blue.shade900,
            fill: Colors.transparent,
            label: 'Continue With Google',
            labelcolor: Colors.black,
            width: 400,
            destination: const Home(),
          ),
        )
      ]),
    );
  }
}
