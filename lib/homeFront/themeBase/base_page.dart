import "package:flutter/material.dart";
import 'package:code/homeFront/homepage/basepage/homepage_base.dart';
import 'package:code/homeFront/accountPage/account_page.dart';
import 'package:code/homeFront/communityPage/community_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int selectedIndex = 0;

  //accès page liste
  static List<Widget> _widgetOptions = <Widget>[
    HomeBasePage(),
    CommunityPage(),
    AccountPage()
  ];

  void _pageChanger(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //bottom nav bar build
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_music), label: "Community"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Account")
            ],
            elevation: 5,
            iconSize: 25,
            onTap: _pageChanger,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.lightBlueAccent,
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.white60,
          ),
        ),
      ),

      //body of the app
      body: Center(child: _widgetOptions.elementAt(selectedIndex)),
    );
  }
}
