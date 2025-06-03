import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:permission_handler/permission_handler.dart';
import '../features/user_flow/notification/notification_cubit/notification_cubit.dart';
import 'app_logs.dart';

/// فئة لإدارة الإشعارات المحلية فقط
class NotificationsManager {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static bool _notificationsEnabled = true; // مفعلة دائمًا في الحالة المحلية

  /// الحصول على حالة تفعيل الإشعارات
  static bool get areNotificationsEnabled => _notificationsEnabled;

  /// تهيئة الإشعارات المحلية فقط
  static Future<void> initializeAllNotifications() async {
    try {
      await requestNotificationPermission();

      AppLogs.infoLog('Initializing local notifications only');

      await initializeLocalNotifications();

      AppLogs.infoLog('Local notifications initialized successfully');
    } catch (e) {
      AppLogs.errorLog('Error initializing local notifications: $e');
      _showNotificationError(
          'حدث خطأ أثناء تهيئة الإشعارات المحلية، بعض الميزات قد لا تعمل.');
    }
  }

  static Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      AppLogs.infoLog("Notification permission granted");
    } else {
      AppLogs.errorLog("Notification permission denied");
      _notificationsEnabled = false;
      _showNotificationError(
          'تم رفض إذن الإشعارات. الرجاء تفعيله من الإعدادات.');
    }
  }

  /// تهيئة إشعارات Flutter المحلية
  static Future<void> initializeLocalNotifications() async {
    try {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
      );

      await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

      AppLogs.infoLog('Local notifications system is ready');
    } catch (e) {
      AppLogs.errorLog('Error during local notification init: $e');
    }
  }

  /// عرض إشعار محلي
  static Future<void> showLocalNotification(String title, String body) async {
    if (!_notificationsEnabled) {
      AppLogs.infoLog('Notifications disabled, skipping notification');
      return;
    }

    try {
      await NotificationCubit().addNotification(title, body);

      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'default_channel_id',
        'default_notifications',
        channelDescription: 'Local notifications channel',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );

      const NotificationDetails platformDetails =
          NotificationDetails(android: androidDetails);

      await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        platformDetails,
        payload: 'Default_Sound',
      );

      AppLogs.infoLog('Local notification shown: $title - $body');
    } catch (e) {
      AppLogs.errorLog('Error showing local notification: $e');
    }
  }

  /// عرض رسالة خطأ للمستخدم
  static void _showNotificationError(String message) {
    BotToast.showText(
      text: message,
      duration: const Duration(seconds: 3),
      contentColor: Colors.orange,
      contentPadding: const EdgeInsets.all(10),
    );
  }
}
