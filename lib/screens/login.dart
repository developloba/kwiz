import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwik/components/progressspinner.dart';
import 'package:kwik/screens/home.dart';
import 'package:kwik/screens/signin.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/errorhandler.dart';
import '../components/custom_widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontrol = TextEditingController();
  final passwordcontrol = TextEditingController();
  final authmanger = AuthManager();
  bool spinning = false;
  Errormanager errormanager = Errormanager();
  String response = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Auth(
            body: Spinner(
          inAsyncall: spinning,
          child: Column(
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
              Txtfield1(
                text: 'Email',
                pad: 10,
                width: 450,
                controls: emailcontrol,
              ),
              PasswordField(
                pad: 15,
                width: 450,
                controls: passwordcontrol,
              ),
              SizedBox(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(response,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontFamily: 'Euclid',
                            color: Colors.red,
                            fontSize: 15)),
                    const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontFamily: 'Euclid',
                          color: Colors.grey,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: primarycolor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    fixedSize: const Size(450, 65),
                    side: const BorderSide(color: Colors.transparent)),
                onPressed: () async {
                  setState(() {
                    spinning = true;
                  });
                  try {
                    await authmanger.loginuser(
                        emailcontrol.text.trim(), passwordcontrol.text.trim());
                    setState(() {
                      spinning = false;
                    });
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      response = errormanager.getMessageFromErrorCode(e.code);
                      spinning = false;
                    });
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
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
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                            side: BorderSide(color: primarycolor, width: 3))),
                    onPressed: () {
                      authmanger.signInWithGoogle();
                    },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New here? Create an account',
                        style: TextStyle(
                            fontFamily: 'Euclid',
                            color: Colors.grey,
                            fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const Signup();
                          }),
                        );
                      },
                      child: Text('here',
                          style: TextStyle(
                              fontFamily: 'Euclid',
                              color: Colors.blue.shade900,
                              fontSize: 18)),
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
