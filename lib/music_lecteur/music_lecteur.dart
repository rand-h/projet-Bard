import 'package:flutter/material.dart';
import 'package:code/Style/text_style.dart';
import 'music_player.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicFront extends StatefulWidget {
  const MusicFront({Key? key}) : super(key: key);

  @override
  State<MusicFront> createState() => _MusicFrontState();
}

class _MusicFrontState extends State<MusicFront> {

AudioPlayer? advancedPlayer;

  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Now Playing',
          style: musicPlayerTextStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF545455),)
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/1.7,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                      //mila image ity container ity (image n le album)

                      //
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber
                    ),
                  ),
                  Text(
                    'Song Title',
                    style: userNameStyle(),
                  ),
                  Text(
                    'artist name',
                    style: standardTextStyle(),
                  ),
                ],
              ),
          ),

          //bottom buttons
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3.8,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(20)
            ),


            //eto no mipetaka ny data an le lecteur
            child: AudioFile(advancedPlayer: advancedPlayer!),
          )
        ],
      ),
    );
  }
}
