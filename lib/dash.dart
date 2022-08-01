import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 200,
          child: Text(
            'This is supposed to be the home page :)',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Euclid', fontSize: 30),
          ),
        ),
      ),
    );
  }
}
