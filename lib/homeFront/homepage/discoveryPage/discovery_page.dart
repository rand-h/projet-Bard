import 'package:code/Style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:code/database/stream_database.dart';
import 'package:code/music_lecteur/music_lecteur.dart';

import 'package:code/database/save.dart';

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> albumList = album;
    final List<dynamic> titleList = titre;
    final List<dynamic> artistList = artist;
    final List<dynamic> urlList = url;
    final List<dynamic> coverList = cover;

    final List<dynamic> albumList2 = album2;
    final List<dynamic> titleList2 = titre2;
    final List<dynamic> artistList2 = artist2;
    final List<dynamic> urlList2 = url2;
    final List<dynamic> coverList2 = cover2;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 370,
      child: Column(
        children: [
          //text et section popular
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: musicListTextStyle(),
                ),
                Text(
                  "See All..",
                  style: musicAlbumTextStyle(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: titleList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MusicFront(
                                url: urlList[index],
                                cover: coverList[index],
                                title: titleList[index],
                                album: artistList[index],
                                //"assets/images/default_cover.png",
                              )));

                      writeAlbum(albumList[index]);
                      writeTitle(titleList[index]);
                      writeUrl(urlList[index]);
                      writeCover(coverList[index]);
                      writeArtist(artistList[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //container misy sary
                          Container(
                            child: FadeInImage(
                              placeholder: AssetImage(
                                  "assets/images/default_cover_purple.png"),
                              image: NetworkImage(coverList[index]),
                              fit: BoxFit.cover,
                            ),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Text(
                            //titleList[index],
                            'Song title',
                            style: musicListTextStyle(),
                          ),
                          Text(
                            //artistList[index],
                            'Artist',
                            style: musicAlbumTextStyle(),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Suggestion",
                  style: musicListTextStyle(),
                ),
                Text(
                  "See All..",
                  style: musicAlbumTextStyle(),
                ),
              ],
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: titleList2.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MusicFront(
                                url: urlList[index],
                                cover: coverList2[index],
                                title: titleList2[index],
                                album: artistList2[index],
                                //"assets/images/default_cover.png",
                              )));

                      writeAlbum(albumList[index]);
                      writeTitle(titleList[index]);
                      writeUrl(urlList[index]);
                      writeCover(coverList[index]);
                      writeArtist(artistList[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //container misy sary
                          Container(
                            child: FadeInImage(
                              placeholder:
                                  AssetImage("assets/images/default_cover.png"),
                              image: NetworkImage(coverList2[index]),
                              fit: BoxFit.cover,
                            ),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Text(
                            'Song title',
                            style: musicListTextStyle(),
                          ),
                          Text(
                            'Artist',
                            style: musicAlbumTextStyle(),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
