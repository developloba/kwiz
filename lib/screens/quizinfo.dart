import 'package:flutter/material.dart';
import 'package:kwik/screens/quizfront.dart';
import 'package:kwik/screens/settings.dart';
import 'package:kwik/utils/constant.dart';

import '../components/icon.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: const Appicon(
                      icon: Icons.arrow_back_ios_sharp,
                    ),
                  ),
                  TextButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Appsettings())));
                    }),
                    child: const Appicon(icon: Icons.settings),
                  )
                ],
              ),
              pinned: true,
              backgroundColor: Colors.blueGrey,
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
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/tri.png',
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Trivia II',
                      style: heading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  backgroundColor: primarycolor,
                                  elevation: 0),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const Quiz();
                                  },
                                ));
                              },
                              child: const Text('Play')),
                        ),
                        const Text(
                          '  |  ',
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                        Icon(
                          Icons.auto_awesome,
                          color: Colors.yellow[700],
                        ),
                        const Text(
                          '4.0',
                          style: body1,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 150,
                    width: 450,
                    child: const Text(
                      "They are quizzes which test a person's general knowledge about insignificant details around a variety of subjects. It was meant to test your knowledge of general knowledge subjects.",
                      textAlign: TextAlign.center,
                      style: body3,
                    ),
                  ),
                  const Text(
                    'Requirements',
                    style: heading2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            SizedBox(
                              height: 100,
                              width: 200,
                              child: Text(
                                "You should probably know a little bit about everything...no pressure though",
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              width: 200,
                              child: Text(
                                  "when was the last time you read ann actual book?"),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: const [
                            SizedBox(
                                height: 100,
                                width: 200,
                                child: Text(
                                    "Maybe you should watch star trek again?")),
                            SizedBox(
                              height: 100,
                              width: 200,
                              child: Text(
                                  "If you listen in class you’ve got nothing to worry about!"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Text(
                    'About the Publisher',
                    style: heading2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/woman.jpg'))),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: const [
                            Text('Amy fitzelbuger',
                                style: TextStyle(fontSize: 15)),
                            Text(
                              'likes long drives and lofi',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      height: 70,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor: primarycolor,
                              elevation: 0),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Quiz();
                              },
                            ));
                          },
                          child: const Text('Play Now')),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
