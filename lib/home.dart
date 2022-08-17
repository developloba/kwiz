import 'package:flutter/material.dart';
import 'package:kwik/question.dart';
import 'custom.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Padding(
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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/woman.jpg'))),
                  )
                ],
              ),
              const SizedBox(
                  width: 300,
                  height: 150,
                  child: Text(
                    'Welcome back Korede',
                    style: TextStyle(
                        fontFamily: 'Pop',
                        fontSize: 45,
                        fontWeight: FontWeight.w700),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 30),
                child: Text(
                  'Here are some picks for you',
                  style: TextStyle(
                      fontFamily: 'Pop', fontSize: 25, color: Colors.grey),
                ),
              ),
              TabBar(
                labelPadding:
                    const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                labelColor: Colors.blue.shade900,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    Circleindicator(color: Colors.blue.shade800, radius: 5),
                indicatorColor: Colors.blue.shade800,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: const [
                  Text(
                    'Maths',
                    style: TextStyle(
                      fontFamily: 'Pop',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Science',
                    style: TextStyle(
                      fontFamily: 'Pop',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Trivia',
                    style: TextStyle(
                      fontFamily: 'Pop',
                      fontSize: 20,
                    ),
                  )
                ],
                controller: tabController,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 300,
                width: 700,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Abstract(
                      pic: Image.asset(
                        'assets/maths.jpg',
                        fit: BoxFit.fill,
                      ),
                      destination: const Quiz(),
                    ),
                    Abstract(
                      pic: Image.asset(
                        'assets/sci.jpg',
                        fit: BoxFit.fill,
                      ),
                      destination: const Quiz(),
                    ),
                    Abstract(
                      pic: Image.asset(
                        'assets/trivia.jpg',
                        fit: BoxFit.fill,
                      ),
                      destination: const Quiz(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(25),
                child: Text('Recommendations',
                    style: TextStyle(
                        fontFamily: 'Pop', fontSize: 25, color: Colors.grey)),
              )
            ],
          ),
        ));
  }
}
