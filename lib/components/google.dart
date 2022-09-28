import 'package:flutter/material.dart';
import 'package:kwik/utils/auth.dart';

import '../utils/constant.dart';

class GoogleLogin extends StatelessWidget {
  GoogleLogin({
    Key? key,
  }) : super(key: key);
  final authmanager = AuthManager();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            authmanager.signInWithGoogle();
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
    );
  }
}
