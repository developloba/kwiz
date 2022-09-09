import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  final auth = FirebaseAuth.instance;

  var userid = FirebaseAuth.instance.currentUser?.uid;
  bool finished = false;
  createuser(email, password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);

    return finished = false;
  }

  loginuser(email, password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class Auth extends StatefulWidget {
  const Auth({super.key, required this.body, required this.destination});
  final Widget body;
  final Widget destination;

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  AuthManager authmanager = AuthManager();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authmanager.auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return widget.destination;
          }
          return widget.body;
        });
  }
}
