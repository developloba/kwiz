import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kwik/components/custom_widgets.dart';
import 'package:kwik/components/progressspinner.dart';
import 'package:kwik/screens/scaffold.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/firestorage.dart';

import '../utils/constant.dart';

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
    var hint = '';
    String userresponse = '';
    return Scaffold(
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
                controls: firstnamecontrol,
                text: 'Firstname',
                width: textFieldwidth.toDouble(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Txtfield1(
                controls: lastnamecontrol,
                text: 'Lastname',
                width: textFieldwidth.toDouble(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: textFieldwidth.toDouble(),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: hint,
                      label: const Text('Date of birth'),
                      labelStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17))),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1926, 1, 1),
                        maxTime: DateTime(2020, 6, 7), onChanged: (date) {
                      setState(() {
                        hint = date as String;
                      });
                    }, onConfirm: (date) {
                      setState(() {
                        hint = date as String;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                ),
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
                await store.additionalUserInfo(
                    firstname: firstnamecontrol.text,
                    lastname: lastnamecontrol.text);
                setState(() {
                  spinning = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Dash();
                  }));
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
    );
  }
}
