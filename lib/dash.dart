import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  final String firstname = 'Korede';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/3.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue.shade900,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 30,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 100, right: 120, left: 120),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Good morning, $firstname',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 35, fontFamily: 'Euclid'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Start a new quiz',
                style: TextStyle(
                    fontFamily: 'Euclid',
                    color: Colors.tealAccent,
                    fontSize: 35),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(125, 54),
                    elevation: 0,
                    primary: Colors.tealAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(183))),
                onPressed: () {},
                child: const Text(
                  'Start',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
