// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBa12-3DjLD2g1DscFvgqTKVgfQsNEnaxg',
    appId: '1:197481453503:web:7135f3ce55c2e68770b30a',
    messagingSenderId: '197481453503',
    projectId: 'projeto-fcn',
    authDomain: 'projeto-fcn.firebaseapp.com',
    storageBucket: 'projeto-fcn.appspot.com',
    measurementId: 'G-BCZXFHTDN2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAixtisFDVKg2tKWm2kTDBVYLkzZneHwH4',
    appId: '1:197481453503:android:715db40b2f6c3b1170b30a',
    messagingSenderId: '197481453503',
    projectId: 'projeto-fcn',
    storageBucket: 'projeto-fcn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjhM7LoPS7qE0W7-sK4YIF_fj4v3Vmp-w',
    appId: '1:197481453503:ios:980d56c1f35d4ce970b30a',
    messagingSenderId: '197481453503',
    projectId: 'projeto-fcn',
    storageBucket: 'projeto-fcn.appspot.com',
    iosClientId: '197481453503-aquhadvv39p05v9e9ng79iht3ffhgd3n.apps.googleusercontent.com',
    iosBundleId: 'br.com.capsistema.projetofcn',
  );
}
