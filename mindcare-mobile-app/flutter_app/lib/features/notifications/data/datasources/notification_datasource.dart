import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/notification_entity.dart';

abstract class NotificationDataSource {
  Future<String?> getDeviceToken();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);
  Stream<RemoteMessage> get onMessageStream;
  Stream<RemoteMessage> get onMessageOpenedAppStream;
  Future<RemoteMessage?> getInitialMessage();
  Future<NotificationSettings> requestPermission();
}

class NotificationDataSourceImpl implements NotificationDataSource {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  Future<String?> getDeviceToken() async {
    try {
      final token = await _messaging.getToken();
      if (kDebugMode) {
        print('FCM Device Token: $token');
      }
      return token;
    } catch (e) {
      throw Exception('Failed to get device token: ${e.toString()}');
    }
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      if (kDebugMode) {
        print('Subscribed to topic: $topic');
      }
    } catch (e) {
      throw Exception('Failed to subscribe to topic: ${e.toString()}');
    }
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
      if (kDebugMode) {
        print('Unsubscribed from topic: $topic');
      }
    } catch (e) {
      throw Exception('Failed to unsubscribe from topic: ${e.toString()}');
    }
  }

  @override
  Stream<RemoteMessage> get onMessageStream {
    return FirebaseMessaging.onMessage;
  }

  @override
  Stream<RemoteMessage> get onMessageOpenedAppStream {
    return FirebaseMessaging.onMessageOpenedApp;
  }

  @override
  Future<RemoteMessage?> getInitialMessage() async {
    try {
      return await _messaging.getInitialMessage();
    } catch (e) {
      throw Exception('Failed to get initial message: ${e.toString()}');
    }
  }

  @override
  Future<NotificationSettings> requestPermission() async {
    try {
      final settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (kDebugMode) {
        print('Notification permission status: ${settings.authorizationStatus}');
      }

      return settings;
    } catch (e) {
      throw Exception('Failed to request notification permission: ${e.toString()}');
    }
  }
}