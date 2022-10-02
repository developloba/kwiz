import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwik/components/carousel_widgets.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/carousel_manager.dart';
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
  CarouselController bigcarouselcontrols = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            height: 2000,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [Avatarbuilder()],
                        ),
                        SizedBox(
                            width: 350,
                            height: 120,
                            child: StreamBuilder<DocumentSnapshot>(
                                stream: store.usercollection
                                    .doc(store.userid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  //checks if the collection has a firstname
                                  if (snapshot.data?.data().toString() !=
                                      null) {
                                    var data = snapshot.data?.get('firstname');
                                    return Text(
                                      'Welcome back, $data',
                                      style: const TextStyle(
                                          fontFamily: 'Euclid',
                                          fontSize: 45,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    );
                                  } else {
                                    return const Text(
                                      'Welcome back',
                                      style: TextStyle(
                                          fontFamily: 'Euclid',
                                          fontSize: 45,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    );
                                  }
                                })),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('Here are some picks for you',
                              style: TextStyle(
                                  fontFamily: 'Euclid',
                                  color: Colors.grey,
                                  fontSize: 25)),
                        ),
                        SizedBox(
                          height: 400,
                          child: Bigcarousel(
                            carouselmamager: carouselmamager,
                            controller: bigcarouselcontrols,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      thickness: 10,
                      color: Colors.grey[200],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      height: 10,
                      thickness: 10,
                      color: Colors.grey[200],
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Recommended Genres',
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
                          Smallcarousel(carouselmanager: carouselmamager),
                        ],
                      ),
                    ),
                  ),
                  
                ])));
  }
}
