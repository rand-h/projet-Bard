
// File generated by FlutLab.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for iOS - '
          'try to add using FlutLab Firebase Configuration',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'it not supported by FlutLab yet, but you can add it manually',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'it not supported by FlutLab yet, but you can add it manually',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'it not supported by FlutLab yet, but you can add it manually',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDlnoxCGW_o-UkN1xK3Q87vTHqQ0qw1Xfg',
    authDomain: 'bard-462e5.firebaseapp.com',
    projectId: 'bard-462e5',
    storageBucket: 'bard-462e5.appspot.com',
    messagingSenderId: '66360189510',
    appId: '1:66360189510:web:3b889124f6aac7d54aa047',
    measurementId: 'G-M7P9SD7ZR0'
  );


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAR-ptKqJP0CpDgBdgMcRD44WGqXyp0BlA',
    appId: '1:66360189510:android:77e4fcd8374187494aa047',
    messagingSenderId: '66360189510',
    projectId: 'bard-462e5',
    storageBucket: 'bard-462e5.appspot.com'
  );
}
