import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';
import 'package:code/music_lecteur/music_lecteur.dart';


Widget choiceWidget(BuildContext context, void Function()? tapFunction1,void Function()? tapFunction2,void Function()? tapFunction3, int pageIndex){

  return Column(
    children: [
      Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left:10),
          child: Text('Category', style:standardTextStyle())),
      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

           //recent
            GestureDetector(
              onTap: tapFunction1,
              child: Container(
                width: (pageIndex == 0)?(MediaQuery.of(context).size.width/3.5)+10:MediaQuery.of(context).size.width/3.5,
                height:(pageIndex == 0)?(MediaQuery.of(context).size.height/3.8)+10:MediaQuery.of(context).size.height/3.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFD7349)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent", style: choiceTextStyle(),),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width/3.2)/1.7,
                      height:(MediaQuery.of(context).size.height/3.5)/3,
                      child: const Image(
                        image: AssetImage('Recent.png'),
                        fit: BoxFit.fill,
                        ),
                    )
                  ],
                ),
              ),
            ),

          //favorites
            GestureDetector(
              onTap: tapFunction2,
              child: Container(
                width: (pageIndex == 1)?(MediaQuery.of(context).size.width/3.5)+10:MediaQuery.of(context).size.width/3.5,
                height:(pageIndex == 1)?(MediaQuery.of(context).size.height/3.8)+10:MediaQuery.of(context).size.height/3.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF66A3FE)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Favorites", style: choiceTextStyle(),),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width/3.2)/1.7,
                      height:(MediaQuery.of(context).size.height/3.5)/3,
                      child: const Image(
                        image: AssetImage('headphones.png'),
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            ),

         //discover
            GestureDetector(
              onTap: tapFunction3,
              child: Container(
                width: (pageIndex == 2)?(MediaQuery.of(context).size.width/3.5)+10:MediaQuery.of(context).size.width/3.5,
                height:(pageIndex == 2)?(MediaQuery.of(context).size.height/3.8)+10:MediaQuery.of(context).size.height/3.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFDA034)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discover", style: choiceTextStyle(),),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width/3.2)/1.7,
                      height:(MediaQuery.of(context).size.height/3.5)/3,
                      child: const Image(
                        image: AssetImage('music-notes.png'),
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
      ),
    ],
  );
}