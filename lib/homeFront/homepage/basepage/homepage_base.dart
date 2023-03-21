import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';
import 'home_choice.dart';
import 'package:code/homeFront/homepage/discoveryPage/discovery_page.dart';
import 'package:code/homeFront/homepage/favoritePage/favorite_page.dart';
import 'package:code/homeFront/homepage/recentpage/recent_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class HomeBasePage extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  var username = "user";
  var dotImage = "offline.png";
  var toolTipMessage = "Connected";

  get message => toolTipMessage;
  get getdotImage => dotImage;

  HomeBasePage({Key? key}) : super(key: key) {
    auth.authStateChanges().listen((User? user) {
      // verifie l'état d'authentification
      if (user == null) {
        username = "user";
        dotImage = "offline.png";
        toolTipMessage = "Disconnected";
        print("user logged out");
      } else {
        username = "user";
        dotImage = "online.png";
        toolTipMessage = "Connected";
        print("user connected");
      }
    });
  }

  @override
  State<HomeBasePage> createState() => _HomeBasePageState();
}

class TooltipSample extends StatelessWidget {
  TooltipSample({super.key});
  var authImage = "offline.png";

  @override
  Widget build(BuildContext context) {
    authImage = HomeBasePage().getdotImage;
    return Tooltip(
      message: HomeBasePage().message,
      child: Image.asset(
        'assets/images/$authImage',
        fit: BoxFit.contain,
      ),
    );
  }
}

class _HomeBasePageState extends State<HomeBasePage> {
  //userName
  String userName = "user";
  var authImage = "offline.png";

  //page index
  int pageIndex = 0;

  //fonction de choix
  void tapFunction1() {
    setState(() {
      pageIndex = 0;
    });
  }

  void tapFunction2() {
    setState(() {
      pageIndex = 1;
    });
  }

  void tapFunction3() {
    setState(() {
      pageIndex = 2;
    });
  }

//ity le teny miaraba am voalohany
  Widget helloWord() {
    userName = widget.username;
    authImage = widget.dotImage;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Hello,", style: helloTextStyle()),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('  $userName', style: userNameStyle()),
              const SizedBox(width: 10),
              Container(
                alignment: Alignment.center,
                width: 15,
                height: 15,
                //child: TooltipSample(),
                /*Image.asset(
                  'assets/images/$authImage',
                  
                  fit: BoxFit.contain,
                ),*/
              ),
            ]),
          ],
        ),
        const Icon(Icons.search, color: Colors.black, size: 40),
      ],
    );
  }

  //widget na choix
  Widget choix() {
    if (pageIndex == 0) {
      return RecentPage();
    } else if (pageIndex == 1) {
      return FavoritePage();
    } else {
      return DiscoveryPage();
    }
  }

  //widget principal
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: helloWord()),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: choiceWidget(
                  context, tapFunction1, tapFunction2, tapFunction3, pageIndex),
            ),
            const SizedBox(
              height: 20,
            ),
            (pageIndex == 0 || pageIndex == 1)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured Music",
                            style: musicListTextStyle(),
                          ),
                          Text(
                            "See All..",
                            style: musicAlbumTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            choix()
          ],
        ),
      ),
    );
  }
}
