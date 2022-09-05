import 'package:flutter/material.dart';
import 'package:kwik/components/custom_widgets.dart';
import 'package:kwik/screens/signin.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/constant.dart';

import 'login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Auth(
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
            Hero(
              tag: 'loginbutt',
              child: NavButton(
                fill: primarycolor,
                width: 450,
                destination: const Login(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NavButton(
              width: 450,
              fill: Colors.white,
              outline: Colors.blue.shade900,
              label: 'Sign Up',
              labelcolor: Colors.blue.shade900,
              destination: const Signup(),
            )
          ],
        ),
      ),
    );
  }
}
