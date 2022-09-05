import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwik/components/progressspinner.dart';
import 'package:kwik/screens/login.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/errorhandler.dart';
import '../components/custom_widgets.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  final authmanager = AuthManager();
  bool spinning = false;
  Errormanager errormanager = Errormanager();

  @override
  Widget build(BuildContext context) {
    String response = '';
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
                    "Create your new account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'Euclid',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Txtfield1(
                controls: emailcontrol,
                text: 'Email',
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
                child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: PasswordField(controls: passwordcontrol)),
              ),
              SizedBox(
                width: 500,
                child: Text(response,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: 'Euclid', color: Colors.red, fontSize: 15)),
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
                    await authmanager.createuser(
                        emailcontrol.text.trim(), passwordcontrol.text.trim());
                    setState(() {
                      spinning = false;
                    });
                  } on FirebaseAuthException catch (e) {
                    response = errormanager.getMessageFromErrorCode(e.code);
                    spinning = false;
                  }
                },
                child: const Text(
                  'Sign Up',
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
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? Log in',
                        style: TextStyle(
                            fontFamily: 'Euclid',
                            color: Colors.grey,
                            fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const Login();
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
        ),
      ),
    );
  }
}
