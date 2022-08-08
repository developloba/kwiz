import 'package:flutter/material.dart';
import 'custom.dart';
import 'dash.dart';

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
            padding: EdgeInsets.only(
              top: 170,
              left: 120,
              right: 120,
            ),
            child: SizedBox(
              height: 150,
              child: Text(
                "We are happy to see you back here",
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Euclid',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Txtfield1(
            pad: 10,
            width: 450,
          ),
          const PasswordField(
            pad: 15,
            width: 450,
          ),
          const SizedBox(
            width: 450,
            child: Text(
              'Forgot Password?',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: 'Euclid', color: Colors.grey, fontSize: 18),
            ),
          ),
          const SizedBox(height: 30),
          Button(
            destination: const Dash(),
            width: 450,
            height: 65,
            fill: Colors.blue.shade900,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: 100,
              child: Text(
                'Or',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Euclid',
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 450,
            height: 65,
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
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                      text: 'New here? Create an account',
                      style: TextStyle(
                          fontFamily: 'Euclid',
                          color: Colors.grey,
                          fontSize: 18)),
                  TextSpan(
                      text: ' here',
                      style: TextStyle(
                          fontFamily: 'Euclid',
                          color: Colors.blue.shade900,
                          fontSize: 18)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
