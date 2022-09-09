import 'package:flutter/material.dart';
import 'package:kwik/screens/welcome.dart';
import 'package:kwik/screens/explore.dart';
import 'package:kwik/screens/login.dart';
import 'package:kwik/screens/profile.dart';
import 'package:kwik/screens/quizfront.dart';
import 'package:kwik/screens/scaffold.dart';
import 'screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'kwiz-080',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: 'Kwiz',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      navigationBarTheme: const NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
              TextStyle(fontFamily: 'Pop', fontSize: 12)),
          indicatorColor: Color.fromARGB(139, 0, 221, 233)),
      primaryColor: Colors.blue.shade900,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      secondaryHeaderColor: Colors.lightBlueAccent[200],
      fontFamily: 'Euclid',
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Pop',
              fontSize: 45,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          bodyText1:
              TextStyle(fontFamily: 'Pop', fontSize: 25, color: Colors.grey),
          bodyText2: TextStyle(
            fontFamily: 'Pop',
            fontSize: 25,
          )),
    ),
    darkTheme: ThemeData(
      primaryColor: Colors.blue.shade100,
      scaffoldBackgroundColor: const Color(0xFF0A0E21),
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      secondaryHeaderColor: Colors.blue,
      fontFamily: 'Euclid',
      textTheme: const TextTheme(
        bodyText1:
            TextStyle(fontFamily: 'Pop', fontSize: 25, color: Colors.white),
        headline1: TextStyle(
            fontFamily: 'Pop',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    ),
    routes: {
      '/': (context) => const Home(),
      '/Loginscreen': (context) => const Login(),
      '/Signupscreen': (context) => const Signup(),
      '/Scaffold': (context) => const Scaffold(),
      '/Home': (context) => const Dash(),
      '/Explorer': (context) => const Explorer(),
      '/Profile': (context) => const Account(),
      '/Quiz': (context) => const Quiz()
    },
  ));
}
