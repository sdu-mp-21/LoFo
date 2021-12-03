import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lofo_app/widgets/login/signup.dart';
import 'styled_widgets.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({Key? key}) : super(key: key);

  @override
  _SigninWidgetState createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  bool hidePassword = true;
  InputDecoration getDec(text, icon, icon_1) {
    InputDecoration decoration = InputDecoration(
      prefixIcon: Icon(icon),
      suffixIcon: icon_1,
      contentPadding: const EdgeInsets.all(25),
      isDense: true,
      filled: true,
      fillColor: Colors.grey.withOpacity(0.4),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.lightBlue, width: 1),
      ),
      labelText: text,
      labelStyle: GoogleFonts.roboto(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
    return decoration;
  }

  final email = TextEditingController();
  final password = TextEditingController();
  List<String> list = [];

  List<String> getList(emailC, passwordC) {
    list.add(emailC.text);
    list.add(passwordC.text);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: [
            // CircleContainer(400, 400, Colors.grey.withOpacity(0.8), 200, 435, 175),
            // CircleContainer(700, 700, Colors.lightBlue, 360, 130, -80),
            // CircleContainer(300, 300, Colors.white, 200, 60, -100),
            ListView(children: [
              Column(
                children: <Widget>[
                  Column(
                    children: [
                      Column(children: [
                        TextWidgetWhite("Welcome Back"),
                      ]),
                      Column(
                        children: [
                          TextFieldWidget(
                            TextField(
                              controller: email,
                              decoration: getDec("Your Email", Icons.email, null),
                            ),
                          ),
                          TextFieldWidget(
                            TextField(
                              controller: password,
                              obscureText: hidePassword,
                              decoration: getDec(
                                  "Password",
                                  Icons.lock,
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      color: Colors.black.withOpacity(0.4),
                                      icon: Icon(hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility))),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ButtonWidget(
                              "Sign In", '/main', getList(email, password)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButtonWidgetToSignUp("Sign Up"),
                        TextButtonWidget("Forgot Passwords", null)
                      ],
                    ),
                  ),
                ],
              ),
            ])
          ],
        ),
      )
    );
  }
}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();
    final Color color = HexColor.fromHex('#B6B3B3');
    final Color color_blue = HexColor.fromHex('#24A5FB');
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    // Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = color;
    canvas.drawPath(blueWave, paint);

    // Grey
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(greyWave, paint);

    // Yellow
    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = color;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
