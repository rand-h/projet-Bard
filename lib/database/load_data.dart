import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

////////////////// Charger les éléments dans une collection de firestore /////////////////////////////////////////////////////////////
class Access_Music_database_collection {
  // acceder aux albums
  // Variables
  String album = "Album"; // collection
  List<String> titles = []; // documents // tous les titres dans l'album
  List<String> path = []; // "path/to/the/music"
  List<int> rating = []; // "rating
  List<String> artist = []; // "Artist name"
  String cover_image = "path/to/the/cover-image";

  //////////////// constructor ////////////////////////////////////////
  Access_Music_database_collection(String collection_name) {
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
      this.cover_image = "assets/cover_default.jpg"; // cover par dafaut
    }
  }
  //////////////////// getter ////////////////////////////////////
  //getter
  get album_name => album; // nom de l'album

  get cover_path => cover_path; // path du cover

  // getter dans des listes
  get all_music_in_album => titles; // liste de titres de musique

  get path_list =>
      path; // liste de path des musiques suivant l'index des titres

  get rating_list =>
      rating; // liste de path des musiques suivant l'index des titres

  get artist_list =>
      artist; // liste de path des musiques suivant l'index des titres

  // getter si titre de musique connue
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
