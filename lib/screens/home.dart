import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwik/utils/auth.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/screens/quizinfo.dart';
import 'package:kwik/utils/firestorage.dart';
import 'package:random_avatar/random_avatar.dart';
import '../components/custom_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AuthManager authmanager = AuthManager();
  Store store = Store();

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
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
                      child: randomAvatar('Starcrasher'),
                    ),
                  )
                ],
              ),
              SizedBox(
                  width: 350,
                  height: 150,
                  child: StreamBuilder<DocumentSnapshot>(
                      stream:
                          store.usercollection.doc(store.userid).snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text(
                            'Welcome back',
                            style: heading,
                          );
                        } else {
                          var data = snapshot.data!.get('firstname');
                          return Text(
                            'Welcome back $data',
                            style: heading,
                          );
                        }
                      })),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 30),
                child: Text(
                  'Here are some picks for you',
                  style: body2,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 700,
                    child: PageView(
                      controller: pageController,
                      children: [
                        Abstractcard(
                          destination: const Info(),
                          pic: Image.asset(
                            'assets/maths.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Abstractcard(
                          destination: const Info(),
                          pic: Image.asset(
                            'assets/sci.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Abstractcard(
                          destination: const Info(),
                          pic: Image.asset(
                            'assets/trivia.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: secondarycolor,

                        dotHeight: 16,
                        dotWidth: 16,

                        // strokeWidth: 5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(25),
                child: Text('Recommendations for you', style: body2),
              ),
              GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: const [
                  SizedBox(
                    width: 200,
                    height: 300,
                    child: Card(
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 300,
                    child: Card(
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 300,
                    child: Card(
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 300,
                    child: Card(
                      color: Colors.blue,
                    ),
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
    ]);
  }
}
