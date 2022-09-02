import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final auth = FirebaseAuth.instance;

  bool finished = false;
  createuser(email, password) async {

    await auth.createUserWithEmailAndPassword(email: email, password: password);

    return finished = false;
  }

  loginuser(email, password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    print('loggin in');
  }
}
