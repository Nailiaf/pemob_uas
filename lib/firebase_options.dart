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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDItqaAa4SaKusFaqugnWI4DRMmfI_pv8Q',
    appId: '1:306400194252:web:bffca74b41b0df56d89c69',
    messagingSenderId: '306400194252',
    projectId: 'pemob-uas-a5923',
    authDomain: 'pemob-uas-a5923.firebaseapp.com',
    storageBucket: 'pemob-uas-a5923.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB93xdmTUK9Tycg0BmIzNEvO-iS2beCCSk',
    appId: '1:306400194252:android:9f053012814a9151d89c69',
    messagingSenderId: '306400194252',
    projectId: 'pemob-uas-a5923',
    storageBucket: 'pemob-uas-a5923.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDChHUg3YnsTI8EQ0TypejQBT_6o7WANK0',
    appId: '1:306400194252:ios:9a709780e62ba216d89c69',
    messagingSenderId: '306400194252',
    projectId: 'pemob-uas-a5923',
    storageBucket: 'pemob-uas-a5923.firebasestorage.app',
    iosBundleId: 'com.example.pemobUas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDChHUg3YnsTI8EQ0TypejQBT_6o7WANK0',
    appId: '1:306400194252:ios:9a709780e62ba216d89c69',
    messagingSenderId: '306400194252',
    projectId: 'pemob-uas-a5923',
    storageBucket: 'pemob-uas-a5923.firebasestorage.app',
    iosBundleId: 'com.example.pemobUas',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDItqaAa4SaKusFaqugnWI4DRMmfI_pv8Q',
    appId: '1:306400194252:web:bc0336d649a4c3d8d89c69',
    messagingSenderId: '306400194252',
    projectId: 'pemob-uas-a5923',
    authDomain: 'pemob-uas-a5923.firebaseapp.com',
    storageBucket: 'pemob-uas-a5923.firebasestorage.app',
  );
}
