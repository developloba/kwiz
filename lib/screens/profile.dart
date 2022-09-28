import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwik/screens/settings.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/components/icon.dart';
import 'package:kwik/components/notifcard.dart';
import 'package:kwik/utils/firestorage.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Store store = Store();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color.fromARGB(255, 34, 87, 36),
          pinned: true,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const Appsettings();
                  })));
                },
                child: const Appicon(
                  icon: Icons.settings,
                  color: Colors.white,
                  backcolor: Colors.black26,
                ),
              )
            ],
          ),
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/leaf.jpg',
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100)))),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
            child: Column(
              children: [
                const Avatarbuilder(
                  size: 150,
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: StreamBuilder<DocumentSnapshot>(
                        stream:
                            store.usercollection.doc(store.userid).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Text(
                              '',
                              style: heading,
                            );
                          } else {
                            var firstname = snapshot.data!.get('firstname');
                            var lastname = snapshot.data!.get('lastname');
                            return Text(
                              '$firstname $lastname',
                              style: heading,
                            );
                          }
                        })),
                const SizedBox(
                  width: 350,
                  height: 80,
                  child: Text(
                    'I like cats but only the ones that like me back',
                    textAlign: TextAlign.center,
                    style: body2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                      size: 30,
                    ),
                    Text(
                      ' | ',
                      style: TextStyle(
                        fontFamily: 'Pop',
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      '12',
                      style: TextStyle(
                        fontFamily: 'Pop',
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Achievements',
                    textAlign: TextAlign.center,
                    style: heading2,
                  ),
                ),
                Notifcard(
                    primary: Colors.white,
                    cardimage: Image.asset('assets/2.png'),
                    cardmessage:
                        'Congratulations on completing Mathematics for dummies',
                    secondary: Colors.black),
                Notifcard(
                    primary: const Color.fromARGB(234, 255, 244, 162),
                    secondary: const Color.fromARGB(234, 89, 85, 56),
                    cardimage: Image.asset('assets/badge.png'),
                    cardmessage: 'Loba just earned the not a goner badge'),
                Notifcard(
                    primary: const Color.fromARGB(234, 112, 112, 237),
                    secondary: const Color.fromARGB(234, 10, 10, 75),
                    cardimage: Image.asset('assets/award.png'),
                    cardmessage:
                        'You recieved the probably going to have a future award')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
