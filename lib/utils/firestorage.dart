import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:kwik/utils/auth.dart';
import 'package:random_avatar/random_avatar.dart';

import '../components/carousel_widgets.dart';
import 'carousel_manager.dart';

class Store {
  final firestore = FirebaseFirestore.instance;
  final userid = AuthManager().userid!;
  additionalUserInfo({firstname, lastname, id}) {
    firestore
        .collection('Users')
        .doc(userid)
        .set({'firstname': firstname, 'lastname': lastname, 'avatar_id': id});
  }

  var usercollection = FirebaseFirestore.instance.collection('Users');

  changeavatar() {
    firestore.collection('Users').doc(userid).update({
      'avatar_id':
          generateWordPairs(random: Random()).map((e) => e).first.toString()
    });
  }
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
          if (snapshot.data.toString().contains('firstname')) {
            return widget.destination;
          } else {
            return widget.body;
          }
        });
  }
}

class Avatarbuilder extends StatelessWidget {
  const Avatarbuilder({Key? key, this.size = 100}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    Store store = Store();
    return StreamBuilder<DocumentSnapshot>(
        stream: store.usercollection.doc(store.userid).snapshots(),
        builder: (context, snapshot) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: SizedBox(
              width: 150,
              height: 180,
              child: randomAvatar(snapshot.data!.get('avatar_id')),
            ),
          );
        });
  }
}

class Genre extends StatelessWidget {
  const Genre({
    Key? key,
    required this.carouselmamager,
  }) : super(key: key);

  final Carousel carouselmamager;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Recommended Genres',
                  style: TextStyle(
                      fontFamily: 'Euclid', fontSize: 25, color: Colors.black)),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Smallcarousel(carouselmanager: carouselmamager),
        Divider(
          color: Colors.grey[100],
          height: 20,
          thickness: 15,
        )
      ],
    );
  }
}
