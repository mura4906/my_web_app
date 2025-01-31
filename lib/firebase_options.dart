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
    apiKey: 'AIzaSyDNssev9yiS6ITrSJYdTGR3ORsaH83rZqw',
    appId: '1:265170523639:web:2cb99a6bb3fbcc7c64caf2',
    messagingSenderId: '265170523639',
    projectId: 'mywebapp-6a202',
    authDomain: 'mywebapp-6a202.firebaseapp.com',
    storageBucket: 'mywebapp-6a202.firebasestorage.app',
    measurementId: 'G-DKS62015MM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBcNiWz1Bc2g2unrv4qFA66Hr86F6fm6I',
    appId: '1:265170523639:android:21df33864baad4bd64caf2',
    messagingSenderId: '265170523639',
    projectId: 'mywebapp-6a202',
    storageBucket: 'mywebapp-6a202.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgaYVTYRaB5QFPhmFSE1DapwF_WLrC--4',
    appId: '1:265170523639:ios:55a3d1652b595ca364caf2',
    messagingSenderId: '265170523639',
    projectId: 'mywebapp-6a202',
    storageBucket: 'mywebapp-6a202.firebasestorage.app',
    iosBundleId: 'com.example.myWebApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgaYVTYRaB5QFPhmFSE1DapwF_WLrC--4',
    appId: '1:265170523639:ios:55a3d1652b595ca364caf2',
    messagingSenderId: '265170523639',
    projectId: 'mywebapp-6a202',
    storageBucket: 'mywebapp-6a202.firebasestorage.app',
    iosBundleId: 'com.example.myWebApp',
  );
}
