import 'package:code/homeFront/themeBase/base_page.dart';
import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:code/login/login.dart';

class AccountPage extends StatefulWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  String login_state = "login";
  var username = "user";
  var color_button = Colors.lightBlue;

  AccountPage({Key? key}) : super(key: key) {
    auth.authStateChanges().listen((User? user) {
      // verifie l'état d'authentification
      if (user == null) {
        this.login_state = "login";
        this.color_button = Colors.lightBlue;
        this.username = "user";
        print("eto");
      } else if (user != null) {
        login_state = "logout";
        try {
          //print("eto ndray");
          this.username = "user (connected)";
          this.color_button = Colors.red;
        } catch (e) {
          print("user actually disconnected");
        }
      }
    });
  }

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    //fond
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: widget.color_button),
                    ),
                    //icone de haut
                    Container(
                      height: 70,
                      padding: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.message_rounded,
                            size: 30,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.search_rounded,
                            size: 30,
                            color: Colors.black54,
                          )
                        ],
                      ),
                    ),

                    //photo de profil
                    Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0x2103a8f4),
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            'assets/images/user-default.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //userNamePlace
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        widget.username,
                        //'username',
                        style: userNameStyle(),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.color_button,
                          fixedSize: const Size.fromWidth(200),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          debugPrint('button pressed');

                          if (widget.login_state == "login") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginWidget()));
                          } else if (widget.login_state == "logout") {
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BasePage()));
                          }
                        },
                        child: Text(
                          //miova en fonction an ny etat an le subscribtion
                          widget.login_state,
                          //'Subscribe',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Calibri',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //nombre subscriber
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Subscriber',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xED1C5488))),
                          const SizedBox(
                            width: 5,
                          ),
                          //variable no tokony ho eto
                          Text(
                            "(number of Sub)",
                            style: standardTextStyle(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          //Manomboka eto amzay ny front end ny content
        ],
      ),
    ));
  }
}
