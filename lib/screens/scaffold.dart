import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kwik/screens/explore.dart';
import 'package:kwik/screens/home.dart';

import 'package:kwik/screens/profile.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  final String firstname = 'Korede';
  int currentPageIndex = 0;
  final navcolor = Colors.grey[200];

  var pages = [const Dash(), const Explorer(), const Account()];
  SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.grey[200]);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          color: navcolor,
          padding: const EdgeInsets.all(10),
          child: NavigationBar(
            backgroundColor: Colors.grey[200],
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                ),
                selectedIcon: Icon(
                  Icons.home_rounded,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: 'Explore',
              ),
              NavigationDestination(
                tooltip: 'heyyy',
                selectedIcon: Icon(Icons.account_circle),
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: <Widget>[
          const Homepage(),
          const Explorer(),
          const Account()
        ][currentPageIndex]);
  }
}
