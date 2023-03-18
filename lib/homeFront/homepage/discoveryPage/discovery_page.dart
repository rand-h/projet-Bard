import 'package:code/Style/text_style.dart';
import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 356,
      child:Column(
        children: [
          //text et section popular
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular", style: musicListTextStyle(),),
                Text("See All..", style: musicAlbumTextStyle(),),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //container misy sary
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Text('Song title', style: musicListTextStyle(),),
                        Text('Artist', style: musicAlbumTextStyle(),)
                      ],
                    ),
                  );
                }
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Suggestion", style: musicListTextStyle(),),
                Text("See All..", style: musicAlbumTextStyle(),),
              ],
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //container misy sary
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Text('Song title', style: musicListTextStyle(),),
                        Text('Artist', style: musicAlbumTextStyle(),)
                      ],
                    ),
                  );
                }
            ),
          ),

        ],
      ),
    );
  }
}
