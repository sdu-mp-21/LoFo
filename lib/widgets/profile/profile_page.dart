import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  var _lights = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 45, 0, 40),
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    image: DecorationImage(
                      image: AssetImage('assets/image/avatarImage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bissenbay Dauletbayev",
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Text("Lecturer",
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.withOpacity(0.8)))
                  ],
                )
              ],
            ),
          ),

          Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 30),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: _lights,
                    onChanged: (bool value) {
                      setState(() {
                        _lights = value;
                      });
                    },
                    activeColor: Colors.lightBlue,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 40),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/change_data');
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.edit_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        'Change personal data',
                        style: TextStyle(fontSize: 20),
                      )),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    null;
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.book),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        'My Posts',
                        style: TextStyle(fontSize: 20),
                      )),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/saved_posts');
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.favorite),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        'Saved Posts',
                        style: TextStyle(fontSize: 20),
                      )),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.lock),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(
                      'Change password',
                      style: TextStyle(fontSize: 20),
                    )),
                    Icon(Icons.chevron_right)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.delete_outline),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(
                      'Delete my account',
                      style: TextStyle(fontSize: 20),
                    )),
                    Icon(Icons.chevron_right)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "Log Out",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Container(
          //   height: 150,
          //   width: 150,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //         image: AssetImage('assets/image/avatarImage.png'),
          //         fit: BoxFit.fill
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20,),
          // const Text('Bissenbay Dauletbayev', style: TextStyle(fontSize: 20),),
          // const SizedBox(height: 5,),
          // const Text('+7 777 000 13 13', style: TextStyle(fontSize: 13),),
          // const SizedBox(height: 30,),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(color: Colors.black)
          //   ),
          //   child: Row(
          //     children: [
          //       const SizedBox(width: 10,),
          //       const Expanded(child: Text('NOTIFICATIONS', style: TextStyle(fontSize: 18,letterSpacing: 1.1),),),
          //       Transform.scale(
          //         scale: 0.8,
          //         child: CupertinoSwitch(
          //           value: _lights,
          //           onChanged: (bool value) { setState(() { _lights = value; }); },
          //           activeColor: Colors.black,
          //         ),
          //       ),

          //     ],
          //   ),
          // ),
          // const SizedBox(height: 30,),
          // GestureDetector(
          //   onTap: (){
          //     Navigator.of(context).pushNamed('/change_data');
          //   },
          //   child: Row(
          //     children: const [
          //       Icon(Icons.change_circle),
          //       SizedBox(width: 5,),
          //       Expanded(child: Text('Change personal data', style: TextStyle(fontSize: 20),)),
          //       Icon(Icons.chevron_right)
          //     ],
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   child: Divider(),
          // ),
          // GestureDetector(
          //   onTap: (){
          //     Navigator.of(context).pushNamed('/saved_posts');
          //   },
          //   child: Row(
          //     children: const [
          //       Icon(Icons.favorite),
          //       SizedBox(width: 5,),
          //       Expanded(child: Text('Saved Posts', style: TextStyle(fontSize: 20),)),
          //       Icon(Icons.chevron_right)
          //     ],
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   child: Divider(),
          // ),
          // Row(
          //   children: const [
          //     Icon(Icons.password),
          //     SizedBox(width: 5,),
          //     Expanded(child: Text('Change password', style: TextStyle(fontSize: 20),)),
          //     Icon(Icons.chevron_right)
          //   ],
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   child: Divider(),
          // ),
          // Row(
          //   children: const [
          //     Icon(Icons.delete_outline),
          //     SizedBox(width: 5,),
          //     Expanded(child: Text('Delete my account', style: TextStyle(fontSize: 20),)),
          //     Icon(Icons.chevron_right)
          //   ],
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   child: Divider(),
          // ),
          // GestureDetector(
          //   onTap: (){
          //     Navigator.of(context).pop();
          //   },
          //   child: Row(
          //     children: const [
          //       Icon(Icons.exit_to_app),
          //       SizedBox(width: 5,),
          //       Expanded(child: Text('Exit', style: TextStyle(fontSize: 20),)),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
