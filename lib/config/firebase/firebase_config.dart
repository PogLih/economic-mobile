// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// import 'firebase_options.dart';
//
// Future<void> initFireBase()async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//   messaging.getToken().then((value) => print('Token:' + value!));
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     if (message.notification != null) {
//       print(
//           'Message also contained a notification: ${message.notification?.body}');
//     }
//   });
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// }
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//
//   print("Handling a background message: ${message.messageId}");
// }