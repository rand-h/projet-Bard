import 'package:code/music_lecteur/music_lecteur.dart';
import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/database/database_.dart';

import 'package:code/database/save.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> albumList = album;
    final List<String> titleList = titre;
    final List<String> artistList = artist;
    final List<String> urlList = url;
    final List<String> coverList = cover;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: ListView.builder(
          itemCount: albumList.length,
          itemBuilder: (context, index) {
            //contenu buildena
            return InkWell(
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MusicFront(
                          url: urlList[index],
                          cover: coverList[index],
                          title: titleList[index],
                          album: albumList[index],

                          //"assets/images/default_cover.png",
                        )));
                writeAlbum(albumList[index]);
                writeTitle(titleList[index]);
                writeUrl(urlList[index]);
                writeCover(coverList[index]);
                writeArtist(artistList[index]);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    //eto no misy sary

                    Container(
                      child: FadeInImage(
                        placeholder: const AssetImage(
                            "assets/images/default_cover_cyan.png"),
                        image: NetworkImage(coverList[index]),
                        fit: BoxFit.cover,
                      ),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlue),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titre[index],
                            //'Song title',
                            style: musicListTextStyle(),
                          ),
                          Text(
                            album[index],
                            //'album or artist name',
                            style: musicAlbumTextStyle(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
