import 'package:flutter/material.dart';
import 'package:kwik/custom_widgets.dart';

class Explorer extends StatefulWidget {
  const Explorer({Key? key}) : super(key: key);

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/logo.png'))),
              ),
              SizedBox(
                  width: 480,
                  height: 80,
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search for quizzes here',
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20))),
                  )),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Categories',
                    style: TextStyle(
                        fontFamily: 'Pop', fontSize: 25, color: Colors.grey)),
              ),
              Abstract(
                  width: 500,
                  length: 250,
                  pic: Image.asset(
                    'assets/maths.jpg',
                    fit: BoxFit.fill,
                  )),
              Abstract(
                  width: 500,
                  length: 250,
                  pic: Image.asset(
                    'assets/sci.jpg',
                    fit: BoxFit.fill,
                  )),
              Abstract(
                  width: 500,
                  length: 250,
                  pic: Image.asset(
                    'assets/trivia.jpg',
                    fit: BoxFit.fill,
                  )),
            ]),
      ),
    );
  }
}
