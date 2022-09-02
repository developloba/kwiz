import 'package:flutter/material.dart';

class Appicon extends StatelessWidget {
  const Appicon(
      {Key? key,
      required this.icon,
      this.color = Colors.white,
      this.backcolor = Colors.white24})
      : super(key: key);
  final IconData icon;
  final Color color;
  final Color backcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: backcolor),
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }
}
