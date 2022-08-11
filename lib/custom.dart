import 'package:flutter/material.dart';
import 'package:kwik/explore.dart';
import 'package:kwik/question.dart';
import 'login.dart';

class Txtfield1 extends StatefulWidget {
  final double width;
  final String text;
  final bool dots;
  final double pad;
  final double top;
  final double side;
  final double bottom;
  const Txtfield1(
      {Key? key,
      this.width = 400,
      this.text = 'Username',
      this.dots = false,
      this.pad = 0,
      this.top = 0,
      this.side = 0,
      this.bottom = 0})
      : super(key: key);

  @override
  State<Txtfield1> createState() => _Txtfield1State();
}

class _Txtfield1State extends State<Txtfield1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.top,
          right: widget.side,
          left: widget.side,
          bottom: widget.bottom),
      child: Padding(
        padding: EdgeInsets.all(widget.pad),
        child: SizedBox(
          width: widget.width,
          child: TextFormField(
              obscureText: widget.dots,
              decoration: InputDecoration(
                  label: Text(
                    widget.text,
                  ),
                  labelStyle: const TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17)))),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final double width;
  final String text;
  final double pad;
  final double side;
  final double top;
  final double butt;

  const PasswordField(
      {Key? key,
      this.width = 400,
      this.text = 'Password',
      this.pad = 25,
      this.butt = 0,
      this.top = 0,
      this.side = 0})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

bool dots = false;

class _PasswordFieldState extends State<PasswordField> {
  @override
  // ignore: must_call_super
  void initState() {
    dots = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.top,
          bottom: widget.butt,
          right: widget.side,
          left: widget.side),
      child: Padding(
        padding: EdgeInsets.all(widget.pad),
        child: SizedBox(
          width: widget.width,
          child: TextFormField(
            obscureText: !dots,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        dots = !dots;
                      });
                    },
                    icon: Icon(dots ? Icons.visibility : Icons.visibility_off)),
                label: Text(
                  widget.text,
                ),
                labelStyle: const TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17))),
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  const Button(
      {Key? key,
      this.width = 295,
      this.height = 75,
      this.label = 'Login',
      this.destination = const Login(),
      this.fill = Colors.blue,
      this.outline = Colors.transparent,
      this.labelcolor = Colors.white})
      : super(key: key);
  final double width;
  final double height;
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final destination;
  final Color fill;
  final Color outline;
  final Color labelcolor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          primary: widget.fill,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          fixedSize: Size(widget.width, widget.height),
          side: BorderSide(color: widget.outline)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.destination),
        );
      },
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: 28,
          color: widget.labelcolor,
        ),
      ),
    );
  }
}

class Component extends StatelessWidget {
  const Component({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        primary: Colors.white24,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(50))),
        fixedSize: const Size(280, 60),
      ),
      onPressed: () {},
      child: const Text(
        'Home',
        style: TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }
}

class Circleindicator extends Decoration {
  final Color color;
  final double radius;
  const Circleindicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([
    VoidCallback? onChanged,
  ]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // ignore: todo
    // TODO: implement paint
    // ignore: no_leading_underscores_for_local_identifiers
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

class Abstract extends StatelessWidget {
  const Abstract(
      {Key? key,
      required this.pic,
      this.destination = const Explorer(),
      this.width = 0,
      this.length = 0})
      : super(key: key);
  final Widget pic;
  final destination;
  final double width;
  final double length;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          width: width,
          height: length,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: pic,
          ),
        ));
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key,
    this.width = 295,
    this.height = 75,
    this.label = 'Login',
    this.destination = const Login(),
    this.fill = Colors.blue,
    this.outline = Colors.transparent,
    this.labelcolor = Colors.white,
    this.pad = 25,
    this.radius = 20,
  }) : super(key: key);
  final double width;
  final double height;
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final destination;
  final Color fill;
  final Color outline;
  final Color labelcolor;
  final double pad;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            primary: fill,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
            fixedSize: Size(width, height),
            side: BorderSide(color: outline)),
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
            fontSize: 28,
            color: labelcolor,
          ),
        ),
      ),
    );
  }
}
