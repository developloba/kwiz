import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:kwik/components/custom_widgets.dart';
import 'package:kwik/components/progressspinner.dart';
import 'package:kwik/screens/scaffold.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/firestorage.dart';
import '../utils/constant.dart';
import 'package:intl/intl.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  bool spinning = false;
  TextEditingController firstnamecontrol = TextEditingController();
  TextEditingController lastnamecontrol = TextEditingController();
  final userid = AuthManager().userid;
  final store = Store();
  @override
  Widget build(BuildContext context) {
    String userresponse = '';
    return Firestream(
      destination: const Dash(),
      stream: store.firestore.collection('Users').snapshots(),
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
                    "Tell us a little more about you",
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
                padding: const EdgeInsets.all(12.0),
                child: Txtfield1(
                  caps: TextCapitalization.words,
                  controls: firstnamecontrol,
                  text: 'Firstname',
                  width: textFieldwidth.toDouble(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Txtfield1(
                  caps: TextCapitalization.words,
                  controls: lastnamecontrol,
                  text: 'Lastname',
                  width: textFieldwidth.toDouble(),
                ),
              ),
              Text(userresponse),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
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
                  var avatarId = generateWordPairs(random: Random())
                      .map((e) => e)
                      .first
                      .toString();

                  await store.additionalUserInfo(
                      firstname:
                          toBeginningOfSentenceCase(firstnamecontrol.text),
                      lastname: toBeginningOfSentenceCase(lastnamecontrol.text),
                      id: avatarId);
                  setState(() {
                    spinning = false;
                  });
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
