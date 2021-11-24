import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lofo_app/api_client/api_client.dart';
import 'package:lofo_app/widgets/profile/change_data/change_data.dart';
import 'package:lofo_app/widgets/profile/saved_posts/saved_posts.dart';
import 'model/saved_posts.dart';
import 'widgets/home.dart';
import 'widgets/intro_slider.dart';
import 'widgets/login/signin.dart';
import 'widgets/login/signup.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  allRecords = await ApiClient().getPost();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

// void initFirebase() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOFO',
      theme: ThemeData(//.withOpacity(0.1)
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/slider',
      routes: {
        '/slider': (context) => const IntroSliderPage(),
        '/main': (context) => const HomeWidget(),
        '/login': (context) => const SigninWidget(),
        '/signup': (context) => const SignupWidget(),
        '/change_data': (context) => const ChangeDataPage(),
        '/saved_posts': (context) => const SavedPostsPage(),
      },
    );
  }
}
