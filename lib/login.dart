import 'package:flutter/material.dart';
import 'package:kwiz/dash.dart';
import 'package:kwiz/main.dart';
import 'custom.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 120, left: 150, right: 150, bottom: 50),
              child: SizedBox(
                height: 150,
                child: Text(
                  "We are happy to see you back here",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Euclid',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Txtfield1(
              width: 400,
            ),
            const PasswordField(),
            const SizedBox(
              height: 50,
            ),
            Button(
              destination: const Dash(),
              width: 400,
              fill: Colors.blue.shade900,
            ),
            const Padding(
              padding: EdgeInsets.all(25),
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
            Button(
              outline: Colors.blue.shade900,
              fill: Colors.transparent,
              label: 'Continue With Google',
              labelcolor: Colors.black,
              width: 400,
              destination: const Home(),
            )
          ],
        ));
  }
}
