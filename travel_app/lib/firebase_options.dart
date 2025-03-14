// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
   //Replace all attributes to yours the existing database is deleted
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC1-lS0BldsfedfhDagdP_62nI6iaEm_xjM-7J-w',
    appId: '1:543246043210:web:3ddefwe95007e61feda3f0cbeb3',
    messagingSenderId: '543246043210',
    projectId: 'travelgenie1-b5bbb',
    authDomain: 'travelgenie1-b5bbb.fdfirebaseapp.com',
    storageBucket: 'travelgenie1-b5bbdfb.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmCP9bDUOc5boKU16IRgLCQJut8iQwjMI',
    appId: '1:543246043210:android:a01297f24ec180110cbeb3',
    messagingSenderId: '543246043210',
    projectId: 'travelgenie1-b5bbb',
    storageBucket: 'travelgenie1-b5bbb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvNHs84AQsnGDJUL7ci8V0nFWyJdpD5HY',
    appId: '1:543246043210:ios:38e33598842d147a0cbeb3',
    messagingSenderId: '543246043210',
    projectId: 'travelgenie1-b5bbb',
    storageBucket: 'travelgenie1-b5bbb.firebasestorage.app',
    iosBundleId: 'com.example.travelApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvNHs84AQsnGDJUL7ci8V0nFWyJdpD5HY',
    appId: '1:543246043210:ios:38e33598842d147a0cbeb3',
    messagingSenderId: '543246043210',
    projectId: 'travelgenie1-b5bbb',
    storageBucket: 'travelgenie1-b5bbb.firebasestorage.app',
    iosBundleId: 'com.example.travelApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1-lS0BlhDagdP_62nI6iaEm_xjM-7J-w',
    appId: '1:543246043210:web:1621504a081958120cbeb3',
    messagingSenderId: '543246043210',
    projectId: 'travelgenie1-b5bbb',
    authDomain: 'travelgenie1-b5bbb.firebaseapp.com',
    storageBucket: 'travelgenie1-b5bbb.firebasestorage.app',
  );
}
