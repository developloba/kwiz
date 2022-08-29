import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Appicon extends StatelessWidget {
  const Appicon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white24),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
