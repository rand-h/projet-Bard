import 'dart:io';
import 'package:path_provider/path_provider.dart';

List<String> save_album = [];
List<String> save_title = [];
List<String> save_artist = [];
List<String> save_url = [];
List<String> save_cover = [];

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;

  return File('$path/recentTitle.sv');
}

Future<File> get _localFile1 async {
  final path = await _localPath;

  return File('$path/recentArtist.sv');
}

Future<File> get _localFile2 async {
  final path = await _localPath;

  return File('$path/recentUrl.sv');
}

Future<File> get _localFile3 async {
  final path = await _localPath;

  return File('$path/recentAlbum.sv');
}

Future<File> get _localFile4 async {
  final path = await _localPath;

  return File('$path/recentCover.sv');
}

//////////////////  Write  ///////////////////////

Future<File> writeAlbum(String t) async {
  final file = await _localFile3;

  // Write the file
  return file.writeAsString('$t');
}

Future<File> writeTitle(String t) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$t');
}

Future<File> writeUrl(String t) async {
  final file = await _localFile2;

  // Write the file
  return file.writeAsString('$t');
}

Future<File> writeCover(String t) async {
  final file = await _localFile4;

  // Write the file
  return file.writeAsString('$t');
}

Future<File> writeArtist(String t) async {
  final file = await _localFile1;

  // Write the file
  return file.writeAsString('$t');
}

///////////////  Read  //////////////////////////

Future<String?> readTitle() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    // return 0;
  }
}

Future<String?> readArtist() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    // return 0;
  }
}

Future<String?> readUrl() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    // return 0;
  }
}

Future<String?> readAlbum() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    // return 0;
  }
}

Future<String?> readCover() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    //return 0;
  }
}
