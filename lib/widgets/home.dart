import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lofo_app/colors/basic_colors.dart';
import 'package:lofo_app/widgets/profile/profile_page.dart';
import 'package:lofo_app/widgets/profile/saved_posts/saved_posts.dart';

import 'add_item/add_item_page.dart';
import 'home/home_page.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String actionBarTitle = 'Lost and Found Items';
  static const textStyle = TextStyle(color: Colors.grey);
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageWidget(),
    SavedPostsPage(),
    ProfilePageWidget(),
  ];

  void _onItemTapped(int index) {
    if(index == 1){  // add page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SavedPostsPage()),
      );
    }else{
      setState(() {
        _selectedIndex = index;
        updateActionBarTitle(index);
      });
    }
  }

  void updateActionBarTitle(int index) {
    if (index == 0) {
      actionBarTitle = 'Lost and Found Items';
    } else if (index == 1) {
      actionBarTitle = 'Create Post';
    } else {
      actionBarTitle = 'Profile';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedIndex==1)?null:AppBar(
        title: Text(actionBarTitle,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: PageTransitionSwitcher(
        transitionBuilder:
            (Widget child, primaryAnimation, secondaryAnimation)=>
                FadeThroughTransition (animation: primaryAnimation, secondaryAnimation: secondaryAnimation,
            child: child,),
        child: _widgetOptions[_selectedIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: textStyle,
        onTap: _onItemTapped,
      ),
    );
  }
}
