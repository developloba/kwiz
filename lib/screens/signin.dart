import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwik/utils/constant.dart';

import '../utils/custom_widgets.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String email;
  late String password;
  final auth = FirebaseAuth.instance;

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
          Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    onChanged: ((value) {
                      email = value;
                    }),
                    decoration: InputDecoration(
                        label: const Text('Email'),
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17)))),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: !dots,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              dots = !dots;
                            });
                          },
                          icon: Icon(
                              dots ? Icons.visibility : Icons.visibility_off)),
                      label: const Text('Password'),
                      labelStyle: const TextStyle(fontSize: 20),
                      hintText: 'Enter a tough password!',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17))),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                primary: primarycolor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                fixedSize: const Size(450, 65),
                side: const BorderSide(color: Colors.transparent)),
            onPressed: () {
              auth.createUserWithEmailAndPassword(
                  email: email, password: password);
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
                    primary: Colors.white,
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
        ],
      ),
    );
  }
}
