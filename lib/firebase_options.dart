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
    apiKey: 'AIzaSyBOWd4hQes9558e4TBKO8zD0BxCr0sOxpM',
    appId: '1:1077700334515:web:bdc542fa1d8e8921d931c6',
    messagingSenderId: '1077700334515',
    projectId: 'mongrh2',
    authDomain: 'mongrh2.firebaseapp.com',
    storageBucket: 'mongrh2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXAUFO_LtQuGJb44j_c1AaroO1SsSDiCo',
    appId: '1:1077700334515:android:15f76598a6a05d5ad931c6',
    messagingSenderId: '1077700334515',
    projectId: 'mongrh2',
    storageBucket: 'mongrh2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWbCnZYOyLnPpSK2MD0tG4XtANgiieFe0',
    appId: '1:1077700334515:ios:9fc49188460806b0d931c6',
    messagingSenderId: '1077700334515',
    projectId: 'mongrh2',
    storageBucket: 'mongrh2.appspot.com',
    iosBundleId: 'com.example.mongrh',
  );
}
