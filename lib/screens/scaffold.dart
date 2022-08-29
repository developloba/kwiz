import 'package:flutter/material.dart';
import 'package:kwik/utils/constant.dart';

import 'package:kwik/screens/explore.dart';
import 'package:kwik/screens/home.dart';

import 'package:kwik/screens/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  final String firstname = 'Korede';
  int currentPageIndex = 0;
  var pages = [const Dash(), const Explorer(), const Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 207, 243, 249),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GNav(
              onTabChange: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              textStyle: heading2,
              selectedIndex: currentPageIndex,
              backgroundColor: const Color.fromARGB(255, 207, 243, 249),
              tabs: const <GButton>[
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.explore,
                  text: 'Explore',
                ),
                GButton(icon: Icons.account_circle, text: 'Profile'),
              ],
              gap: 20,
              color: Colors.black,
              iconSize: 30,
              tabBackgroundColor: const Color.fromARGB(255, 226, 251, 255),
            ),
          ),
        ),
        body: <Widget>[
          const Homepage(),
          const Explorer(),
          const Account()
        ][currentPageIndex]);
  }
}
