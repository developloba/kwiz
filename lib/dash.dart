import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kwik/explore.dart';
import 'package:kwik/home.dart';
import 'package:kwik/main.dart';
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
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          backgroundColor: Colors.blue.shade50,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Explore',
              selectedIcon: Icon(Icons.explore_sharp),
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black12,
                  systemNavigationBarColor: Colors.cyan.shade50
                  // Status ba
                  ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Kwiz',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                    fontFamily: 'Euclid',
                    fontSize: 30),
              )),
        ),
        backgroundColor: Colors.white,
        body: <Widget>[
          const Homepage(),
          const Explorer(),
          const Account()
        ][currentPageIndex]);
  }
}
