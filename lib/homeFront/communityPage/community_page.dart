import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'clip_shadow_path.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: ClipShadowPath(
            shadow: const Shadow(blurRadius: 5, color: Colors.grey),
            clipper: CustomAppBar(),
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 40,
                      color: Colors.white,
                      child: const Image(
                        image: AssetImage('bard_logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  //mbola ampiana gesture detector
                  const Icon(
                    Icons.search_rounded,
                    size: 35,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ), /*ClipPath(
            clipper: CustomAppBar(),
            child: Container(
              //eto no manova couleur
              color: Colors.lightBlueAccent,
              child: const Center(
                child: SizedBox(
                  width: 200,
                  height: 30,
                  child: Image(image: AssetImage('bard_logo.png'),fit: BoxFit.contain,),
                ),
              ),
            ),


          ),*/
        ),
        body: Container(
          alignment: AlignmentDirectional(0, -4),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          child: Image.asset('assets/images/coming_soon.jpg', fit: BoxFit.fill),
        ),
      ),
    );
  }
}
