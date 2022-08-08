import 'package:flutter/material.dart';

import 'package:kwik/explore.dart';
import 'package:kwik/home.dart';

import 'package:kwik/profile.dart';
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
        bottomNavigationBar: Container(
          color: Colors.blue.shade50,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GNav(
              onTabChange: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              backgroundColor: Colors.blue.shade50,
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
              tabBackgroundColor: Colors.blue.shade100,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: <Widget>[
          const Homepage(),
          const Explorer(),
          const Account()
        ][currentPageIndex]);
  }
}
