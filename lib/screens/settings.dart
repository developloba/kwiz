import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/firestorage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

showSettings(context, store, authmanager) {
  Alert(
    type: AlertType.none,
    context: context,
    title: 'Settings',
    content: SizedBox(
      height: 500,
      width: 400,
      child: Column(
        children: [
          TextButton(
            child: Text(
              'Change Avatar',
              style: TextStyle(color: primarycolor, fontSize: 30),
            ),
            onPressed: () {
              store.changeavatar();
            },
          ),
          TextButton(
            child: Text(
              'Log out',
              style: TextStyle(color: primarycolor, fontSize: 30),
            ),
            onPressed: () {
              authmanager.auth.signOut();
            },
          ),
        ],
      ),
    ),
    style: AlertStyle(
      animationType: AnimationType.fromRight,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      descStyle: const TextStyle(),
      descTextAlign: TextAlign.center,
      animationDuration: const Duration(milliseconds: 300),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      titleStyle: heading,
      alertAlignment: Alignment.center,
    ),
  ).show();
}
