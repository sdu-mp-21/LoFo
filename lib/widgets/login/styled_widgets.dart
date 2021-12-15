import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lofo_app/widgets/login/signin.dart';
import 'package:lofo_app/widgets/login/signup.dart';

class TextWidget extends StatelessWidget {
  final text;
  TextWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white.withOpacity(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 120, bottom: 70),
              width: 303,
              child: Text(
                text,
                style: GoogleFonts.roboto(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ));
  }
}

class TextFieldWidget extends StatelessWidget {
  final child;

  TextFieldWidget(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(5),
      child: Material(
        color: Colors.grey.withOpacity(0),
        // color: Colors.transparent,
        child: child,
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final text;
  final route;
  final dataList;
  TextStyle style = GoogleFonts.roboto(
      fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);
  ButtonWidget(this.text, this.route, this.dataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: OutlinedButton(
          onPressed: () {
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return AlertDialog(
            //       // Retrieve the text the user has entered by using the
            //       // TextEditingController.
            //       content: Column(
            //         children: [

            //         ],
            //       ),
            //     );
            //   },
            // );

            Navigator.of(context).pushReplacementNamed(route);
          },
          style: OutlinedButton.styleFrom(
              primary: Colors.black,
              side: BorderSide(color: Colors.black, width: 1.0),
              shape: StadiumBorder(),
              minimumSize: Size(320, 50)),
          child: Text(text, style: style)),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  final text;
  final route;
  TextButtonWidget(this.text, this.route);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(route);
          },
          child: Text(
            text,
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class TextButtonWidgetToSignUp extends StatelessWidget {
  final text;
  TextButtonWidgetToSignUp(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(_createRouteToSignUp());
          },
          child: Text(
            text,
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final width;
  final height;
  final color;
  final x;
  final y;
  final radius;

  CircleContainer(
      this.height, this.width, this.color, this.radius, this.x, this.y);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: CustomPaint(
          painter: OpenPainter(color, radius, x, y),
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  final color;
  final x;
  final y;
  final radius;

  OpenPainter(this.color, this.radius, this.x, this.y);

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(Offset(x, y), radius, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TextWidgetWhite extends StatelessWidget {
  final text;
  TextWidgetWhite(this.text);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white.withOpacity(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80, bottom: 70),
              width: 303,
              child: Text(
                text,
                style: GoogleFonts.roboto(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ));
  }
}

class TextWidgetWhiteSignUp extends StatelessWidget {
  final text;
  TextWidgetWhiteSignUp(this.text);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white.withOpacity(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              width: 303,
              child: Text(
                text,
                style: GoogleFonts.roboto(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ));
  }
}

class TextWidgetWhiteSignIn extends StatelessWidget {
  final text;
  TextWidgetWhiteSignIn(this.text);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white.withOpacity(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              width: 303,
              child: Text(
                text,
                style: GoogleFonts.roboto(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ));
  }
}

class TextButtonWidgetToSignIn extends StatelessWidget {
  final text;
  TextButtonWidgetToSignIn(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(_createRouteToSignIn());
          },
          child: Text(
            text,
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}

Route _createRouteToSignIn() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SigninWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRouteToSignUp() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const SignupWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
