import 'package:code/database/database.dart';
import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';
import 'music_player.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicFront extends StatefulWidget {
  String url = "";
  String cover =
      "data:image/png;base64,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";
  String title = "Titre";
  String album = "Album";

  MusicFront(
      {Key? key,
      required this.url,
      required this.cover,
      required this.title,
      required this.album})
      : super(key: key);

  @override
  State<MusicFront> createState() => _MusicFrontState();
}

class _MusicFrontState extends State<MusicFront> {
  AudioPlayer? advancedPlayer;

  String url_music = "";
  String cover_music = "";
  String title_music = "";
  String album_music = "";

  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    url_music = widget.url;
    cover_music = widget.cover;
    title_music = widget.title;
    album_music = widget.album;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Now Playing',
          style: musicPlayerTextStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF545455),
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.7,
            child: Column(
              children: [
                Container(
                  child: Image.network(
                    cover_music,
                    //coverList[index],
                    //"assets/images/default_cover.png",
                    fit: BoxFit.cover,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      //mila image ity container ity (image n le album)

                      //
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber),
                ),
                Text(
                  title_music,
                  textAlign: TextAlign.center,

                  //'Song Title',
                  style: userNameStyle(),
                ),
                Text(
                  album_music,
                  textAlign: TextAlign.center,
                  //'artist name',
                  style: standardTextStyle(),
                ),
              ],
            ),
          ),

          //bottom buttons
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.8,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20)),

            //eto no mipetaka ny data an le lecteur
            child: AudioFile(
                advancedPlayer: advancedPlayer!, music_path: url_music),
          )
        ],
      ),
    );
  }
}
