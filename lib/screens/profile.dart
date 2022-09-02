import 'package:flutter/material.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/components/icon.dart';
import 'package:kwik/components/notifcard.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: double.maxFinite,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              child: Container(
                height: 900,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/background.jpg'))),
              ),
            ),
            Positioned(
                top: 50,
                right: 50,
                child: TextButton(
                  child: const Appicon(
                    icon: Icons.settings,
                    color: Colors.black,
                    backcolor: Colors.black26,
                  ),
                  onPressed: () {},
                )),
            Positioned(
                top: 180,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                )),
            Positioned(
              top: 130,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/woman.jpg'))),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child: Text(
                        'Mary Fitzelburger',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Pop',
                            fontSize: 38,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 350,
                    height: 80,
                    child: Text(
                      'I like cats but only the ones that like me back',
                      textAlign: TextAlign.center,
                      style: body2,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.red,
                        size: 30,
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          fontFamily: 'Pop',
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '12',
                        style: TextStyle(
                          fontFamily: 'Pop',
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Achievements',
                      textAlign: TextAlign.center,
                      style: heading2,
                    ),
                  ),
                  Notifcard(
                      primary: Colors.white,
                      cardimage: Image.asset('assets/2.png'),
                      cardmessage:
                          'Congratulations on completing Mathematics for dummies',
                      secondary: Colors.black),
                  Notifcard(
                      primary: const Color.fromARGB(234, 255, 244, 162),
                      secondary: const Color.fromARGB(234, 89, 85, 56),
                      cardimage: Image.asset('assets/badge.png'),
                      cardmessage: 'Mary just earned the not a goner badge'),
                  Notifcard(
                      primary: const Color.fromARGB(234, 112, 112, 237),
                      secondary: const Color.fromARGB(234, 10, 10, 75),
                      cardimage: Image.asset('assets/award.png'),
                      cardmessage:
                          'You recieved the probably going to have a future award')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
