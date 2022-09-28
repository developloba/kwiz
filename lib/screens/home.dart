import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/carousel_manager.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/firestorage.dart';

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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          expandedHeight: 380,
          collapsedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: 500,
              color: primarycolor,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Avatarbuilder()],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        width: 350,
                        height: 120,
                        child: StreamBuilder<DocumentSnapshot>(
                            stream: store.usercollection
                                .doc(store.userid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              //checks if the collection has a firstname
                              if (snapshot.data!
                                  .data()
                                  .toString()
                                  .contains('firstname')) {
                                var data = snapshot.data!.get('firstname');
                                return Text(
                                  'Welcome back, $data',
                                  style: const TextStyle(
                                      fontFamily: 'Euclid',
                                      fontSize: 45,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                );
                              } else {
                                return const Text(
                                  'Welcome back',
                                  style: TextStyle(
                                      fontFamily: 'Euclid',
                                      fontSize: 45,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                );
                              }
                            })),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Here are some picks for you',
                          style: TextStyle(
                              fontFamily: 'Euclid',
                              color: Colors.white,
                              fontSize: 25)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                  height: 70,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                      )))),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Popular with students',
                              style: TextStyle(
                                  fontFamily: 'Euclid',
                                  fontSize: 25,
                                  color: Colors.black)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                            itemCount: carouselmamager.recommendations.length,
                            itemBuilder: ((context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, bottom: 20, top: 20),
                                    child: SizedBox(
                                      width: 120,
                                      height: 120,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: carouselmamager
                                            .recommendation_images[index],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                            carouselmamager
                                                .recommendations[index],
                                            style: const TextStyle(
                                                fontFamily: 'Pop',
                                                fontSize: 20,
                                                color: Colors.black)),
                                      ),
                                      Text(carouselmamager.author[index],
                                          style: const TextStyle(
                                              fontFamily: 'Pop',
                                              fontSize: 15,
                                              color: Colors.grey))
                                    ],
                                  )
                                ],
                              );
                            })),
                      )
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      authmanager.auth.signOut();
                    },
                    child: const Text('sign out of here'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
