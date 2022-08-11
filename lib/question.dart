import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:kwik/custom.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

var responsee = response[0];
List<Text> response = [
  const Text(''),
  const Text('Correct',
      style: TextStyle(fontFamily: 'Pop', fontSize: 25, color: Colors.green)),
  const Text('Incorrect',
      style: TextStyle(fontFamily: 'Pop', fontSize: 25, color: Colors.red))
];

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/3.png',
                ),
                fit: BoxFit.fill)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: GlassmorphicContainer(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                borderRadius: 0,
                linearGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black12,
                      Colors.black12
                    ],
                    stops: [
                      0.3,
                      1,
                    ]),
                border: 0,
                blur: 70,
                borderGradient: const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.black12,
                      Colors.black26
                    ],
                    stops: [
                      0.06,
                      0.95,
                    ]),
              ),
            ),
            Positioned(
                top: 200,
                child: Container(
                  height: 600,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 20),
                        child: SizedBox(
                          width: 200,
                          child: Text('Is the sky blue?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Pop',
                                fontSize: 30,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16),
                              primary: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fixedSize: const Size(295, 75),
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          onPressed: () {
                            setState(() {
                              responsee = response[1];
                            });
                          },
                          child: const Text(
                            'True',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16),
                              primary: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fixedSize: const Size(295, 75),
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          onPressed: () {
                            setState(() {
                              responsee = response[2];
                            });
                          },
                          child: const Text(
                            'False',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: 50,
                          child: responsee,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
