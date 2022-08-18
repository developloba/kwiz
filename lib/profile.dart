import 'package:flutter/material.dart';
import 'package:kwik/custom_widgets.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            child: Container(
              height: 900,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('assets/leaf.jpg'))),
            ),
          ),
          Positioned(
              top: 50,
              right: 50,
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              )),
          Positioned(
              top: 180,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
              )),
          Positioned(
            top: 130,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/woman.jpg'))),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child: Text(
                        'Mary Fitzelburger',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Pop',
                            fontSize: 38,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 350,
                    height: 80,
                    child: Text(
                      'I like cats but only the ones that like me back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Pop', fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.red,
                        size: 30,
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          fontFamily: 'Pop',
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '12',
                        style: TextStyle(
                          fontFamily: 'Pop',
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const Text(
                    'Achievements',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Euclid', fontSize: 30, color: Colors.grey),
                  ),
                  Abstract(
                    pic: Image.asset('assets/background.jpg'),
                    width: 500,
                    length: 400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
