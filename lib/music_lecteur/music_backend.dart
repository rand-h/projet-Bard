import 'package:flutter/material.dart';

class MusicFront extends StatefulWidget {
  const MusicFront({Key? key}) : super(key: key);

  @override
  State<MusicFront> createState() => _MusicFrontState();
}

class _MusicFrontState extends State<MusicFront> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing',
          style: TextStyle(),
        ),
      ),
      body: Container(

      ),
    );
  }
}
