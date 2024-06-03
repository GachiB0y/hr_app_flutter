import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// @pragma('vm:entry-point')
void _handleMessage(RemoteMessage? message) {
  if (message != null) {
    debugPrint('Title foreground: ${message.notification?.title}');
    debugPrint('Body: ${message.notification?.body}');
    debugPrint('Payload: ${message.data}');
  }
}

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title background: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}

Future<void> initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.getInitialMessage().then(_handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
}

/// IFirebaseApi
abstract interface class IFirebaseApi {
  /// Initialize push notifications.
  Future<void> initNotifications();

  /// Get fCMToken for send push.
  Future<String?> getFCMToken();
}

class FirebaseApi implements IFirebaseApi {
  final _firebasseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> initNotifications() => initPushNotifications();

  @override
  Future<String?> getFCMToken() async {
    await _firebasseMessaging.requestPermission();
    final String? fCMToken = await _firebasseMessaging.getToken();
    return fCMToken;
  }
}
