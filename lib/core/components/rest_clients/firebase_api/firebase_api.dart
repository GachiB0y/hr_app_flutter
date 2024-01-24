import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebasseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebasseMessaging.requestPermission();
    final fCMToken = await _firebasseMessaging.getToken();
    print('Token:$fCMToken');
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }
}
