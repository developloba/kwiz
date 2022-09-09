import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kwik/utils/auth.dart';

class Store {
  final firestore = FirebaseFirestore.instance;
  final userid = AuthManager().userid!;
  additionalUserInfo({firstname, lastname}) {
    firestore
        .collection('Users')
        .doc(userid)
        .set({'firstname': firstname, 'lastname': lastname});
  }

  var usercollection = FirebaseFirestore.instance.collection('Users');
}

class Firestream extends StatefulWidget {
  const Firestream(
      {super.key,
      required this.body,
      required this.destination,
      required this.stream});
  final Widget body;
  final Stream stream;
  final Widget destination;
  @override
  State<Firestream> createState() => _FirestreamState();
}

class _FirestreamState extends State<Firestream> {
  final firestore = FirebaseFirestore.instance;
  final store = Store();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return widget.body;
          }
          return widget.destination;
        });
  }
}
