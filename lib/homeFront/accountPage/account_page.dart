import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

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
                        decoration: const BoxDecoration(
                          color: Colors.brown
                        ),
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
                            Icon(Icons.message_rounded, size: 30, color: Colors.black54,),
                            SizedBox(width: 5,),
                            Icon(Icons.search_rounded, size: 30,color: Colors.black54,)
                          ],
                        ),
                      ),

                      //photo de profil
                      Padding(
                        padding: EdgeInsets.only(top:200),
                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(100)
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
                          'username',
                          style: userNameStyle(),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            fixedSize: const Size.fromWidth(200),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                            onPressed:(){
                              debugPrint('button pressed');
                            }, child: const Text(
                          //miova en fonction an ny etat an le subscribtion
                          'Subscribe',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Calibri',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        ),

                        //nombre subscriber
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Subscriber',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xED1C5488))),
                            const SizedBox(width: 5,),
                            //variable no tokony ho eto
                            Text("(number of Sub)",
                              style: standardTextStyle(),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Manomboka eto amzay ny front end ny content
          ],
        ),
      )
    );
  }
}
