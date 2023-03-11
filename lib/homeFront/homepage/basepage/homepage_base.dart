import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';
import 'home_choice.dart';
import 'package:code/homeFront/homepage/discoveryPage/discovery_page.dart';
import 'package:code/homeFront/homepage/favoritePage/favorite_page.dart';
import 'package:code/homeFront/homepage/recentpage/recent_page.dart';

class HomeBasePage extends StatefulWidget {
  const HomeBasePage({Key? key}) : super(key: key);

  @override
  State<HomeBasePage> createState() => _HomeBasePageState();
}

class _HomeBasePageState extends State<HomeBasePage> {

  //userName
  String userName = "user";
  //page index
  int pageIndex = 0;

  //fonction de choix
  void tapFunction1(){
    setState(() {
      pageIndex = 0;
    });
  }
  void tapFunction2(){
    setState(() {
      pageIndex = 1;
    });
  }
  void tapFunction3(){
    setState(() {
      pageIndex = 2;
    });
  }

//ity le teny miaraba am voalohany
  Widget helloWord (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Hello,",style: helloTextStyle()),
            Text('  $userName', style: userNameStyle()),
          ],
        ),
        const Icon(
          Icons.search,
          color: Colors.black,
          size: 40
        ),
      ],
    );
  }

  //widget na choix
  Widget choix(){
    if(pageIndex == 0){
      return const DiscoveryPage();
    }else if(pageIndex == 1){
      return const FavoritePage();
    }else{
      return const RecentPage();
    }
  }

  //widget principal
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
                child: helloWord()),
            const SizedBox(height: 20,),
            SizedBox(
              child: choiceWidget(context,tapFunction1,tapFunction2, tapFunction3, pageIndex),
            ),
            const SizedBox(height: 20,),
            choix()
          ],

        ),
      ),
    );
  }
}
