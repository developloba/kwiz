import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwik/components/icon.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/firestorage.dart';

class Appsettings extends StatefulWidget {
  const Appsettings({super.key});

  @override
  State<Appsettings> createState() => _AppsettingsState();
}

class _AppsettingsState extends State<Appsettings> {
  Store store = Store();
  AuthManager authManager = AuthManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Avatarbuilder(
                        size: 100,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: store.usercollection
                                  .doc(store.userid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Text(
                                    '',
                                    style: heading,
                                  );
                                } else {
                                  var firstname =
                                      snapshot.data!.get('firstname');
                                  var lastname = snapshot.data!.get('lastname');
                                  return Text(
                                    '$firstname $lastname',
                                    style: heading,
                                  );
                                }
                              })),
                    ],
                  ),
                ),
              ),
              Settingbutton(
                store: store,
                label: 'Change Avatar',
                onpressed: (() {
                  store.changeavatar();
                }),
              ),
              Settingbutton(
                store: store,
                label: 'Log Out',
                onpressed: () {
                  authManager.auth.signOut();
                },
              )
            ],
          ),
        ));
  }
}

class Settingbutton extends StatelessWidget {
  const Settingbutton(
      {Key? key, required this.store, this.onpressed, required this.label})
      : super(key: key);

  final Store store;
  final void Function()? onpressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.white,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          fixedSize: const Size(500, 80),
        ),
        onPressed: () {
          onpressed!.call();
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 28,
            color: primarycolor,
          ),
        ),
      ),
    );
  }
}
