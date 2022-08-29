import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/tri.png'),
                  )),
                ),
              ),
              Positioned(
                  top: 50,
                  right: 50,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(),
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  )),
              Positioned(
                  top: 200,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                  )),
            ],
          )),
    );
  }
}
