import 'package:cloud_firestore/cloud_firestore.dart';


/// album list ///
List<String> album_list() {
  List<String> value = [];
  try {
    FirebaseFirestore.instance
        .collection("all_collection")
        .get()
        .then((QuerySnapshot querySnapshot) {
      final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
      //print(docu);
      value = docu
          .map((element) => (element as dynamic)['album'].toString())
          .toList();

      //print(album_list);
    });
  } catch (e) {
    value = [];
  }
  return value;
}

/// titre //
List<String> title_list(String album) {
  List<String> value = [];
  try {
    FirebaseFirestore.instance
        .collection(album)
        .get()
        .then((QuerySnapshot querySnapshot) {
      final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
      value = docu
          .map((element) => (element as dynamic)['titre'].toString())
          .toList();
    });
  } catch (e) {
    value = [];
  }
  //print(title_list);
  return value;
}

// path //
List<String> path_list(String album) {
  List<String> value = [];
  try {
    FirebaseFirestore.instance
        .collection(album)
        .get()
        .then((QuerySnapshot querySnapshot) {
      final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
      value = docu
          .map((element) => (element as dynamic)['path'].toString())
          .toList();
    });
  } catch (e) {
    value = [];
  }
  //print(path_list);
  return value;
}

// url //
List<String> url_list(String album) {
  List<String> value = [];
  try {
    FirebaseFirestore.instance
        .collection(album)
        .get()
        .then((QuerySnapshot querySnapshot) {
      final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
      value = docu
          .map((element) => (element as dynamic)['url'].toString())
          .toList();
    });
  } catch (e) {
    value = [];
  }
  return value;
}

// path //
List<String> artist_list(String album) {
  List<String> value = [];
  try {
    FirebaseFirestore.instance
        .collection(album)
        .get()
        .then((QuerySnapshot querySnapshot) {
      final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
      value = docu
          .map((element) => (element as dynamic)['artist'].toString())
          .toList();
    });
  } catch (e) {
    value = [];
  }
  return value;
}

// cover_list //
List<String> cover_list(String album) {
  List<String> value = [];
  try {
    FirebaseFirestore.instance
        .collection(album)
        .get()
        .then((QuerySnapshot querySnapshot) {
      final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
      value = docu
          .map((element) => (element as dynamic)['cover'].toString())
          .toList();
    });
  } catch (e) {
    value = [];
  }
  return value;
}

// rating //
List<int> rating_list(String album) {
  List<int> value = [];
  try {
    FirebaseFirestore.instance
        .collection(album)
        .get()
        .then((QuerySnapshot querySnapshot) {
      final docu = querySnapshot.docs.map((doc) => doc.data()).toList();
      value = docu
          .map((element) => ((element as dynamic)['rating']) ?? 0)
          .toList()
          .cast<int>();
    });
  } catch (e) {
    value = [];
  }
  return value;
}

// url du cover //
String cover_url(String album) {
  String value =
      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIUAAACFCAMAAABCBMsOAAAAvVBMVEX7N0L/////6+z7MDz/7u/7Kjf+09T7FCb42tz+8/T4aHD/9/j2X2f7JjT7Mj77Ljr7IC/8eH7+4eL7SVL+ysz9pKf7UFn8cXf9lZr7AB38ZWz+29z9tbj9wcT8fYP9n6P8jZL8hYr7QUu+S1G1Iir8W2P9r7LlsbSvFiDFKTLbMDrxztDoubvNd3vKb3PWio3FXWK3LzesAAmpARPdmp3VWV/tND65O0Hrmp7WO0PcGyi7FiLsIy/QHyvhpqicABH9AAAG7ElEQVR4nO3bWXebOBQAYLHIDiFCAgzGC/ES23GcNI2TNJ22M/3/P2sE8Tm2kYQuWGnz4PvUBzd8R8vVlRDI+gyB/jagjLNiH2fFPs6KfbRW+J6dr7LrcBfZKrc9/48qvF4SpmzQZYRSpwhKCesOWBomPe+PKPxOkjKGaYDECChmLJ10GrdJM4U/ylLMHAlgHw7BaTZqBmmkWC0ZkbWB0CaELVcfo4imAwYh7CBsMIuMK6IZImDCexAEdsAUfkaaGkoHyWBTBqRY0TaG0oETQ4rREjQk5RGQdGRCkVDa2lAEpZOTFe6SnWQogqX2aYocndYQu+ZA+SmK5IQRcRgBqe+VWsWsa8RQRHfWUuFfnj4k9sGGNamjRpFigwiEcKpe4ZQKf2kWwRlLJUOl8A23RMlIVZ2iUlyaR3DGsJliZnJg7oPNmigSc1P0OLryvCFV5G2X0F040qq0DCLNojKFjVpnzMDBGAfLMFYl/gDJ1hSZYtlq7Qgcwti8n407ru97fdXfoClMkTQemQHfjqC0P8lHtsvDtm23p5xjTDI0RMWovtAXAJiiuJ/lncj1SkAZbkc902kHoAD3B2+BLovDJB+5/gFAq3DEPhEUCWR+OJiR+XCW9MoeOAZoFYgItWhV4WPt/MDBfHm96kW250meD1AgUs3kVUWmbQo66fEhoAZAFNN6RaRFsJVfDwAoEIlqFTOtojsCIHQKfF2niHQGQwoURDWKqX6CdC9MKMisRjEAtIURBRr4SsUKkLsNKchKpfCXgLXUkCI4KkIPFSPIMqZR8ExSpBKtArGOQqHPWLWKMpff33555L/QK44y14HCTyHFjVThup7vXdx+fdo+v6xfHn2AIog9qUL7H+UK3gf2xcPr03a9Xi/u7jYo+AZRINKTKiagavNQwSsKO7r//eVmu35ZLO42b+UvnCuYIpMqUlB5s1O4xYJW9MGC9wEH7AQNFEEsU3iwQq9U8FH48PVpvQNUfgFUIOZKFD24wr3/vn0fBG+SX4AVPYkCVGS9K7ynX3JAIwWeSBQhrN4sFd/qfgtV0L6ogGWLneKybiBDFUHsCwrg4DSoQF1PUESAVd2wYhAJih5wm25QwXJBAaktTCsSQQFaUM0q8FRQXAM3hgYVNBQUwHRhUuGIij5wq25ScfkpFMOz4tMr/sYc6QuKz5EvpsCD74/NndDzRYMKIq4jubE1lfahq9lYUJirL8jMA1Y5I0FhotYKisAsh+xTkbTWOrHupNhB8ziO02U4Bu3ZuXku1p2NavCqwukOk96oPDbgATm/QPIa3JrApqpMQYYd//gIuPV+pMHerKJwhlH1NAGiOHhhs1e4QAV/RkXBxCMN0A7Rligs0PAMkFtV0NAXj1UAe/a5JVPUnV8EFJMy0EpQ4JV4ugM5v5hKFT2lApN5fzpJkmSVd1yhR2jeTiE/y/EUXULRZOT775PwfSKYUKjOtRTnz3gYVV9DVHpkLFHkOgU+6JAjRUc2S4JUmIZVxcQTFN4/rc87pUmc5ZJnHCmCH8Icce0fmgkXpKqzX2sldkkwFwxCvvj56lURjz81TXH87uxI4Yuru3MpOWStZvD17eHIcb3o8ZcGgQaeUiF5VURDgGLz8njvFW8z3eIQOHpdrJWHXrvAoaVWREJvyhXDypq6WTxvH19vHx4efn+9eVnf6VoCOaMahXVdHdrOlezwXRjGb5vFeheLO11DCE1RVYgvJ94iweA+/Cv5y29vmyL0BB5sVKsQM9e/1QnAR9/2xLtkRxlLpnCF8bl4OGbwafjfaYjDs2e5QjwC3mxv9+/y+Ry4f9JOQ00cvg1QKKy4Wtlunm9+39uez1c0++L26XlxIsKJhWeKCnE15ON/sf1+w+M7/1f1FUDjOFzSlQorExe1zd3iPWoO4aHBhP6Q38tJTdzpVIWkP+SKyDFzq1MWAZXdzpbe1xqfeF+rJoj0zrz87lr2YXfXqvmqTmGFH9MaJJQ/TnWn0fjtziKkN8bqFG5snkHjaubWKfi+wDSDKi+Z1tz79Qy3Bo3V149rbh+7S5NDlKSq7qhX8Jli8D64YnYAFFZm7G68PE/AFNbYaXTDUREO1XxlpPtmIooNfDMR677s0X8/kuHTmsPBkqW8scLqxKfMFRKLRU0bhWVNWNvUgWU1TUuF5U5bOTCb1iSJxgq+XboOmjqwEwI+bGqk4I5w0CB7BGQANjT7DtFLUqa/kFsQMEsnsL5orig+C53FRNMiASHxrPeB32QW4faymBEsLZADBxMWT3tNmqGdogg7zy7jbpdjqFO+E3Eof3y3O7/Mct2nZeYURfh2ZzyZ9fvDq+XVsN+fTcYd+89+t3zM8Vs/3KDCRJwV+zgr9nFW7ON/4VKLd5osmqkAAAAASUVORK5CYII=";

  try {
    FirebaseFirestore.instance
        .collection(album)
        .doc('cover')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data();
        value = (data as dynamic)['url'].toString();
      }
    });
  } catch (e) {
    //default url cover
    value =
        "data:image/png;base64,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";
  }
  return value;
}

//////////////////////////

var titre = [
  " 02 Truth, Beauty and Hatred",
  " 04 The Grimm Troupe",
  " 01 Hive Knight",
  "03 Nightmare Lantern (Interlude)",
  " 01 Ori, Lost In the Storm",
  " 02 Naru, Embracing the Light",
  " 03 Calling Out",
  " 04 The Blinded Forest",
];

var artist = ["", "", "", "", "", "", "", ""];

var album = [
  "Hollow_knight",
  "Hollow_knight",
  "Hollow_knight",
  "Hollow_knight",
  "Ori and the blind forest",
  "Ori and the blind forest",
  "Ori and the blind forest",
  "Ori and the blind forest"
];

var rating = [
  5,
  3.5,
  4,
  4.5,
  5,
  4.5,
  3,
  4.8,
];

var url = [
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2F02%20Truth%2C%20Beauty%20and%20Hatred.mp3?alt=media&token=0799912d-f56e-4d5a-8480-4592fe5c1b3e",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2F04%20The%20Grimm%20Troupe.mp3?alt=media&token=8d97e866-7d66-4604-a1ad-dce23a200567",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2F01%20Hive%20Knight.mp3?alt=media&token=f2dac364-4f3d-4782-bad0-4723e89ab369",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2F03%20Nightmare%20Lantern%20(Interlude).mp3?alt=media&token=b8816872-6469-407c-bfcf-59ba4490455d",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2F01%20Ori%2C%20Lost%20In%20the%20Storm%20(feat.%20Aeralie%20Brighton).mp3?alt=media&token=450f319e-9ca2-4123-85ca-49cce6b8a1c7",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2F02%20Naru%2C%20Embracing%20the%20Light%20(feat.%20Rachel%20Mellis).mp3?alt=media&token=7fbc8d88-7a5c-43aa-ab83-4df9a11b55f5",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2F03%20Calling%20Out.mp3?alt=media&token=632534b8-f518-4c43-86a1-97d31f53d257",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2F04%20The%20Blinded%20Forest.mp3?alt=media&token=8508d3d1-2db5-45bf-9cba-329d1778d89a",
];

var cover = [
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2Fcover.png?alt=media&token=96b015f0-b9b8-4d0f-a13f-0fade482b32a",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2Fcover.png?alt=media&token=96b015f0-b9b8-4d0f-a13f-0fade482b32a",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2Fcover.png?alt=media&token=96b015f0-b9b8-4d0f-a13f-0fade482b32a",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Hollow%20knight%2FGod%20and%20Nightmare%2Fcover.png?alt=media&token=96b015f0-b9b8-4d0f-a13f-0fade482b32a",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2Fcover.jpg?alt=media&token=5d61838f-bdcd-4cbb-aec6-c321a2379c1c",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2Fcover.jpg?alt=media&token=5d61838f-bdcd-4cbb-aec6-c321a2379c1c",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2Fcover.jpg?alt=media&token=5d61838f-bdcd-4cbb-aec6-c321a2379c1c",
  "https://firebasestorage.googleapis.com/v0/b/bard-462e5.appspot.com/o/Ori%20and%20the%20blind%20forest%2Fcover.jpg?alt=media&token=5d61838f-bdcd-4cbb-aec6-c321a2379c1c",
];
