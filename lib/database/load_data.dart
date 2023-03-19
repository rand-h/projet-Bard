import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:code/firebase_options.dart';

////////////////// Charger les éléments dans une collection de firestore /////////////////////////////////////////////////////////////
class Access_Music_database_collection {
  // acceder aux albums
  // Variables
  String album = "Album"; // collection
  List<String> titles = []; // documents // tous les titres dans l'album
  List<String> path = []; // "path/to/the/music"
  List<String> url = [];
  List<int> rating = []; // "rating
  List<String> artist = []; // "Artist name"
  String cover_image = "path/to/the/cover-image";
  String cover_URL = "url";

  //////////////// constructor ////////////////////////////////////////
  Access_Music_database_collection(String collection_name) {
    //reçoit en entrer un nom d'album
    CollectionReference musique =
        FirebaseFirestore.instance.collection(collection_name);

    this.album = collection_name; //nom de la collection dans cloud firestore

    //////////////// information des musiques /////////////////////////
    try {
      // Get data from docs and convert map to List
      musique.get().then((QuerySnapshot querySnapshot) {
        final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
        this.titles = docu
            .map(
                (element) => (element as dynamic)['title'].toString() ?? "vide")
            .toList();
        //docu.forEach((element) => this.titles.add(element['title'].toString()));
      });

      this
          .titles
          .forEach((titre) => musique.get().then((QuerySnapshot querySnapshot) {
                // pour chaque titre, recuperer les informations
                querySnapshot.docs.forEach((doc) {
                  this.path.add(doc["path"]);
                  this.url.add(doc["url"]);
                  this.rating.add(doc["rating"]);
                  this.artist.add(doc["artist"]);
                });
              }));
    } catch (e) {
      print("Error");
    }
    ////////////////// path du cover ////////////////////
    ///
    try {
      // s'il n'y a pas de cover, mettre une image par defaut
      musique.doc('cover').get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          final data = documentSnapshot.data();
          this.cover_image =
              (data as dynamic)['path']; // recuperer le path du cover
        }
      });
    } catch (e) {
      this.cover_image = "assets/images/default_cover.jpg"; // cover par dafaut
    }

    try {
      // s'il n'y a pas de cover, mettre une image par defaut
      musique.doc('cover').get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          final data = documentSnapshot.data();
          this.cover_URL =
              (data as dynamic)['url'].toString(); // recuperer le path du cover
        }
      });
    } catch (e) {
      //default url cover
      this.cover_URL =
          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAilBMVEX////pHmPoAFr0qbv60d7pFWDoAFnsVH/oAFboC13oAFXoBlz//f/+8/f++fv84erxhaT96/LuX4r72eT2tMf3usz0obnzmLLrOnLwcZfqLmztWITzkK361eDsQXjvcpb4xtTxe574w9LtTH/uaY/tT4L2sMTznLXqHmj84evweZz3uMvzk6/vZpBUMvQSAAAExUlEQVR4nO3dWXeySBCA4QB2D9AuILiBIrgy3yT//+8NoJnEHbQ8XcXUe5mTC55DNzvy8cFxHMdxHMdxHMdxHMdxHMdxHPc/bZet+rqX4b1ZrnSTSafFSksZhlC2sRkHLVWWwjJhmtNZONC9OG/oW1giHammXuum5S/hUemuJ52e7sUC7ExYKZWdt2haXhEepqVqy7S8IawGrCmjFkzL28LjtJTxJ+1peV94nJbR1zjQvaBP91hYIotpGc1CX/fCPlUt4XHAupE3ojdgawuPShXPF7SUjYSVUsloSGlaNhYah2lpkJmWzwirimlZHMQSGLBPC8t16dginmPfW74irJTFtIwtzNPyVWGltNe6GXeCEBriL92MO7GQhSzUHwtZyEL9sZCFLNQfC1lIUijaLhTbXKlmSmJCM/hYTOJcOvWV1ISd8u9+6iW2dFosLPN3G9OuM2DJCssW+63xcMCSFn5UA3at7g5Y6sKirr9b5u7NAdsCYdViX67Ka8q2CIt6aZY4l8oWCcsGu2V0toVtmbCoH+y37q9V2T5hWX/lTb8HbDuFZYNwM5XFgG2vsKgXTGLl0rq71kxY1l+N37FoQEEIccdC+rGQfiykHwvpx0L6sZB+LKQfC+nHQvqxkH4spB8L6cdC+rGQfiykXyuE/cVqFFrWbrS68kIrdaE/8uLctaU0i6S03Xybhf7vH/MgLQy8K88wCUeaSfaDoCv098nNJ32FY04/j789Q1U4yG4/ZndAKveregGbptBf1nm417FLI0VhdyJqPrzsKK+7oyfsTM16vjIVbS4GM3bh3G30IoG4/G/cQj+WTXxXQy0MjJozkKowNZu/0ENKGDbYxJAUjl6fgriFHRsGiFYYNHzdjJywF0EBsQo3EK+CYhaOoSYhVuEAEIhTOAQ4lEEthNoTohX24bajSIVj0FWIUZiDAhEKd7CrEKEQdhYiFHbgjmaQCjPIfSFGIeAhN1JhCnnAhlI4h56G6IRb6EGKTdgD3hniE67ApyE2oQVzBRGx0IPeG6ITrsE3NNiE4D50QvhpaJipbtRJ8DsLQ6a6Ub97w+4QmdBvvfAd69BE9RmA7huE6m/dqpPeIcT17RH4QxpD4foixxT+mEboNp02A1+JAtnvBY3BT/GdP7pNp/0DvqlRyH4RaeBCC+1Ut+ks+IuJ2D54+Ad4UyNi3aLzwO/LfOoWnecDr0O50C26aAg6EUXS1Q26KAQdpmqi23NZDxJoOBg/kAt5e00MdWuu5QPu9F1825myJdhKxHbU/d0AbFvj4rpU+pMHdILhbHRLbgV1p1tg3JAeCkHusUmE+8L/gng4USS6Fffq5a+PU2TX2M7rvLw9tUPdhge9+hy09HQLHjZ/iahmupe/RrMXBqra6l76Wg2fJqoE28WZG2VPEs0hvtPeG82fOs2wl7qXu0FW8zcQhY3u2tPdgqjhswuOkepe5oZ1l01Wo5BDXPfSapUmtTc4ZjTSvbRP1R3LWieMyp0T2Ulc1p8Yj8aqUMIjOEB/6o8T885bpY6cfpL2VS28698RE8rOsw7Z8XlSPxjHtitNxxGHHFPa7nrfEt53g9TKvuJ1kqzjr8xa4XpYhuM4juM4juM4juM4juM4juM4TmP/AudCUi3iCxyZAAAAAElFTkSuQmCC"; // cover par dafaut
    }
  }
  //////////////////// getter ////////////////////////////////////
  //getter
  get album_name => album; // nom de l'album

  get cover_path => cover_path; // path du cover

  get cover_url => cover_URL; // url du cover

  // getter dans des listes
  get all_music_in_album => titles; // liste de titres de musique

  get path_list =>
      path; // liste de path des musiques suivant l'index des titres

  get url_list => url; //liste url des musiques

  get rating_list =>
      rating; // liste de path des musiques suivant l'index des titres

  get artist_list =>
      artist; // liste de path des musiques suivant l'index des titres

  // getter methode si titre de musique connue
  String musique_path(String titre_connue) {
    var sortie = "";
    FirebaseFirestore.instance
        .collection(album)
        .doc(titre_connue)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        final data = documentSnapshot.data();
        sortie = (data as dynamic)['path']; // recuperer le path du cover
      } else {
        print('Document does not exist on the database');
        sortie = 'Document does not exist on the database';
      }
    });
    return sortie ?? "";
  }

  String musique_url(String titre_connue) {
    var sortie = "";
    FirebaseFirestore.instance
        .collection(album)
        .doc(titre_connue)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        final data = documentSnapshot.data();
        sortie = (data as dynamic)['url']; // recuperer le path du cover
      } else {
        print('Document does not exist on the database');
        sortie = 'Document does not exist on the database';
      }
    });
    return sortie ?? "";
  }

  int musique_rating(String titre_connue) {
    var sortie = 0;
    FirebaseFirestore.instance
        .collection(album)
        .doc(titre_connue)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        final data = documentSnapshot.data();
        sortie = (data as dynamic)['rating'].toInt() ??
            0; // recuperer le path du cover
      } else {
        print('Document does not exist on the database');
        sortie = 0;
      }
    });
    return sortie;
  }

  String musique_artist(String titre_connue) {
    var sortie = "";
    FirebaseFirestore.instance
        .collection(album)
        .doc(titre_connue)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        final data = documentSnapshot.data();
        sortie = (data as dynamic)['artist']; // recuperer le path du cover
      } else {
        print('Document does not exist on the database');
        sortie = 'Document does not exist on the database';
      }
    });
    return sortie ?? "";
  }
}

///////////////////////////////////////////////////////////////////////////////
// charger tout les albums de firestore dans une liste ["album1","album2", "..."]

// a imbriquer dans Access_Music_database_collection
class LoadAllCollection {
  final String collect =
      "all_collection"; // liste tous les albums dans firestore
  List<String> album_list = [];

  LoadAllCollection() {
    CollectionReference album = FirebaseFirestore.instance.collection(collect);

    try {
      // Get data from docs and convert map to List
      album.get().then((QuerySnapshot querySnapshot) {
        final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
        this.album_list = docu
            .map(
                (element) => (element as dynamic)['album'].toString() ?? "vide")
            .toList();
        //docu.forEach((element) => this.titles.add(element['title'].toString()));
      });
    } catch (e) {
      this.album_list = [];
    }
  }

  get albums => album_list;
}
