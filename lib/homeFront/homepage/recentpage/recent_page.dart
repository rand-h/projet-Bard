import 'dart:html';

import 'package:code/music_lecteur/music_lecteur.dart';
import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/database/database.dart';

import 'package:code/database/save.dart';

class RecentPage extends StatefulWidget {
  // constructor
  const RecentPage({Key? key}) : super(key: key);

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
/*
  List<String> _albumList = [];
  List<String> _titleList = [];
  List<String> _artistList = [];
  List<String> _urlList = [];
  List<String> _coverList = [];
  String _coverUrl = "";

  String album = "Hollow_knight";

  @override
  void initState() {
    loadData();
  }

  Future<void> loadData() async {
    setState(() async {
      _albumList = await album_list();
      _titleList = await title_list(album);
      _artistList = await artist_list(album);
      _urlList = await url_list(album);
      _coverList = await cover_list(album);
      _coverUrl = await cover_url(album);
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    List<String> albumList = album;
    List<String> titleList = titre;
    List<String> artistList = artist;
    List<String> urlList = url;
    List<String> coverList = cover;

    try {
      albumList.add(readAlbum() as dynamic);
      titleList.add(readTitle() as dynamic);
      artistList.add(readArtist() as dynamic);
      urlList.add(readUrl() as dynamic);
      coverList.add(readCover() as dynamic);
    } catch (e) {
      print("liste vide");
    }

    return
//// debu d'ajout de contenu ///////
        SizedBox(
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
                        placeholder:
                            const AssetImage("assets/images/default_cover.png"),
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
