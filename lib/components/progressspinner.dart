import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kwik/utils/constant.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Spinner extends StatefulWidget {
  const Spinner({super.key, required this.child, required this.inAsyncall});
  final Widget child;
  final bool inAsyncall;

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 8,
      progressIndicator: SpinKitChasingDots(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index.isEven ? primarycolor : secondarycolor,
            ),
          );
        },
      ),
      inAsyncCall: widget.inAsyncall,
      opacity: 0.3,
      child: widget.child,
    );
  }
}
