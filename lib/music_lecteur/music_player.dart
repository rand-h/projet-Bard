import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioFile extends StatefulWidget {

  final AudioPlayer advancedPlayer;

  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {

  Duration _duration = Duration();
  Duration _position = Duration();

  final String path = 'https://archive.org/download/lp_schumann-fantasy-in-c-major-op-17-chopin-f_jakob-gimpel/disc1/02.02.%20Chopin%20Fantasy%20In%20F%20Minor%2C%20Op.%2049_sample.mp3';
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  bool isLoop = false;
  Color? colorz = Colors.black;

  List<IconData> _icons = [
    Icons.play_circle_filled_rounded,
    Icons.pause_circle_filled_rounded
  ];

  @override
  void initState() {
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((d) { setState(() {
      _duration = d;
    });
    });

    widget.advancedPlayer.onPositionChanged.listen((p) { setState(() {
      _position = p;
    });});

    widget.advancedPlayer.setSourceUrl(path);
    widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if(isRepeat == true){
          isPlaying =true;
        }else{
          isPlaying = false;
          isRepeat = false;
        }


      });
    });
  }

  Widget btnStart(){
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false?Icon(_icons[0], size: 50,):Icon(_icons[1], size: 50,),
      color: Colors.white,
      onPressed: (){

        if(isPlaying == false){
          widget.advancedPlayer.play(UrlSource(path));
          setState(() {
            isPlaying = true;
          });
        }else if(isPlaying == true){
          widget.advancedPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }

      },
    );
  }

  Widget btnFast(){
    return IconButton(
      icon: const Icon(Icons.skip_next_rounded, size: 40,),
      onPressed: (){

      },
    );
  }

  Widget btnSlow(){
    return IconButton(
      icon: const Icon(Icons.skip_previous_rounded, size: 40,),
      onPressed: (){

      },
    );
  }

  Widget btnRepeat(){
    return IconButton(
      icon: Icon(
        Icons.repeat_rounded,
        size: 30,
        color: colorz,
      ),
      onPressed: (){
        if(isRepeat == false){
          widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat =true;
            colorz = Colors.white;
          });
        }else if(isRepeat == true){
          widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
          setState(() {
            colorz = Colors.black;
            isRepeat = false;
          });
        }
      },
    );
  }
  Widget btnLoop(){
    return IconButton(
      icon: const Icon(Icons.loop_rounded, size: 30,),
      onPressed: (){
      },
    );
  }


  Widget loadAsset(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop()
        ],
      ),
    );
  }

  Widget slider(){
    void changeToSecond(int second){
      Duration newDuration = Duration(seconds: second);
      widget.advancedPlayer.seek(newDuration);
    }

    return Slider(
        activeColor: Colors.white,
        inactiveColor: Colors.blueGrey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value){
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0], style: const TextStyle(fontSize:16),),

                Text(_duration.toString().split(".")[0], style: const TextStyle(fontSize: 16),)
              ],
            ),
          ),

          slider(),
          loadAsset(),


        ],
      ),
    );
  }
}
