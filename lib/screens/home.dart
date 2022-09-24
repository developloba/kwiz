import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwik/components/carousel_widgets.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/carousel_manager.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/firestorage.dart';
import 'package:random_avatar/random_avatar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AuthManager authmanager = AuthManager();
  Store store = Store();
  Carousel carouselmamager = Carousel();
  PageController contoller2 = PageController(viewportFraction: 0.6);
  PageController pagecontroller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: primarycolor,
            width: MediaQuery.of(context).size.width,
            height: 2000,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      width: 65,
                      height: 65,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: SizedBox(
                        width: 150,
                        height: 180,
                        child: randomAvatar('Sugar crush'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    width: 350,
                    height: 120,
                    child: StreamBuilder<DocumentSnapshot>(
                        stream:
                            store.usercollection.doc(store.userid).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Text(
                              'Welcome back',
                              style: TextStyle(
                                  fontFamily: 'Euclid',
                                  fontSize: 45,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );
                          } else {
                            var data = snapshot.data!.get('firstname');
                            return Text(
                              'Welcome back $data',
                              style: const TextStyle(
                                  fontFamily: 'Euclid',
                                  fontSize: 45,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );
                          }
                        })),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Here are some picks for you',
                      style: TextStyle(
                          fontFamily: 'Euclid',
                          color: Colors.white,
                          fontSize: 25)),
                ),
              ],
            ),
          ),
          Positioned(
              top: 400,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    )),
              )),
          Positioned(
            top: 280,
            bottom: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Bigcarousel(carouselmamager: carouselmamager),
                  ),
                  SizedBox(
                      width: 520,
                      height: 350,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        clipBehavior: Clip.antiAlias,
                        color: const Color.fromARGB(136, 207, 206, 206),
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('Recommended Genres', style: body1),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                            Smallcarousel(carouselmanager: carouselmamager)
                          ],
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        authmanager.auth.signOut();
                      },
                      child: const Text('sign out of here'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
