import 'package:flutter/material.dart';
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
