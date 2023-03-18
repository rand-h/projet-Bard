import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: ListView.builder(
          itemBuilder: (context, index){
            //contenu buildena
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [

                  //eto no misy sary
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber
                    ),
                  ),

                  const SizedBox(width: 10,),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Song title', style: musicListTextStyle(),),
                        Text('album or artist name', style: musicAlbumTextStyle(),),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
