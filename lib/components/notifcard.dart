import 'package:flutter/material.dart';

class Notifcard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Notifcard(
      {Key? key,
      required this.primary,
      required this.secondary,
      required this.cardimage,
      required this.cardmessage})
      : super();
  final Color primary;
  final Color secondary;
  final Image cardimage;
  final String cardmessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 280,
        width: 500,
        child: Card(
          color: primary,
          elevation: 10,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: secondary),
              borderRadius: BorderRadius.circular(70)),
          child: Row(
              textBaseline: TextBaseline.ideographic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 180,
                  child: cardimage,
                ),
                SizedBox(
                    width: 230,
                    height: 200,
                    child: Center(
                      child: Text(
                        cardmessage,
                        style: const TextStyle(fontSize: 22),
                        textAlign: TextAlign.left,
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
