import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lofo_app/widgets/login/signin.dart';
import 'styled_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool hidePassword = true;
  InputDecoration getDec(text, icon, icon_1) {
    InputDecoration decoration = InputDecoration(
      prefixIcon: Container(
        child: FaIcon(
          icon,
          size: 20,
        ),
        margin: EdgeInsets.fromLTRB(15, 13, 0, 0),
      ),
      suffixIcon: icon_1,
      contentPadding: const EdgeInsets.all(15),
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

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final image = TextEditingController();
  final role = TextEditingController();
  final phone_number = TextEditingController();
  final whats_up_number = TextEditingController();
  final instagram_name = TextEditingController();
  List<String> list = [];

  List<String> getList(nameC, emailC, passwordC) {
    list.add(nameC.text);
    list.add(emailC.text);
    list.add(passwordC.text);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: BackgroundSignUp(),
      child: Stack(
        children: [
          // CircleContainer(700, 700, Colors.lightBlue, 360, 100, -80),
          // CircleContainer(400, 400, Colors.grey.withOpacity(0.8), 220, 360, 820),
          ListView(children: [
            Column(
              children: <Widget>[
                Column(
                  children: [
                    TextWidgetWhiteSignUp("Create Account"),
                    Column(
                      children: [
                        TextFieldWidget(
                          TextField(
                            controller: name,
                            decoration:
                                getDec("Name", FontAwesomeIcons.userAlt, null),
                          ),
                        ),
                        TextFieldWidget(
                          TextField(
                            controller: email,
                            decoration: getDec(
                                "Your Email", FontAwesomeIcons.envelope, null),
                          ),
                        ),
                        TextFieldWidget(
                          TextField(
                            controller: image,
                            decoration:
                                getDec("Image", FontAwesomeIcons.image, null),
                          ),
                        ),
                        TextFieldWidget(
                          TextField(
                            controller: role,
                            decoration: getDec(
                                "Role", FontAwesomeIcons.graduationCap, null),
                          ),
                        ),
                        TextFieldWidget(
                          TextField(
                            controller: phone_number,
                            decoration: getDec("Phone Number",
                                FontAwesomeIcons.phoneAlt, null),
                          ),
                        ),
                        TextFieldWidget(
                          TextField(
                            controller: whats_up_number,
                            decoration: getDec("WhatsApp number",
                                FontAwesomeIcons.whatsapp, null),
                          ),
                        ),
                        TextFieldWidget(
                          TextField(
                            controller: instagram_name,
                            decoration: getDec("Istagram Name",
                                FontAwesomeIcons.instagram, null),
                          ),
                        ),
                        TextFieldWidget(
                          TextField(
                            controller: password,
                            obscureText: hidePassword,
                            decoration: getDec(
                                "Password",
                                FontAwesomeIcons.lock,
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
                            "Sign Up", '/main', getList(name, email, password)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButtonWidgetToSignIn("Sign In"),
                    ],
                  ),
                ),
              ],
            ),
          ])
        ],
      ),
    ));
  }
}

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();
    final Color color = HexColor.fromHex('#B6B3B3');

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    // Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.5, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    // Grey
    Path greyPath = Path();
    greyPath.lineTo(sw, 0);
    greyPath.lineTo(sw, sh * 0.3);
    greyPath.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyPath.close();
    paint.color = color;
    canvas.drawPath(greyPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
