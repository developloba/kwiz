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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: primarycolor,
          pinned: true,
          expandedHeight: 380,
          collapsedHeight: 100,
          flexibleSpace: Container(
            height: 500,
            color: primarycolor,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                              'Welcome back, $data',
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
                Genre(carouselmamager: carouselmamager),
                Column(
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
                      height: 400,
                      child: ListView.builder(
                          itemCount: carouselmamager.recommendations.length,
                          itemBuilder: ((context, index) {
                            return Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey,
                                  ),
                                  child: carouselmamager
                                      .recommendation_images[index],
                                )
                              ],
                            );
                          })),
                    )
                  ],
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

class Genre extends StatelessWidget {
  const Genre({
    Key? key,
    required this.carouselmamager,
  }) : super(key: key);

  final Carousel carouselmamager;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
          ),
          Smallcarousel(carouselmanager: carouselmamager),
          Divider(
            color: Colors.grey[100],
            height: 20,
            thickness: 20,
          )
        ],
      ),
    );
  }
}
