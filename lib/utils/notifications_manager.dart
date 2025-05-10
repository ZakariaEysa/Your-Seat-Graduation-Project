import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'app_logs.dart';

/// فئة لإدارة الإشعارات - محلية و Firebase
class NotificationsManager {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static late final FirebaseMessaging _messaging;
  static bool _notificationsEnabled = false;

  /// الحصول على حالة تفعيل الإشعارات
  static bool get areNotificationsEnabled => _notificationsEnabled;

  /// تهيئة جميع الإشعارات
  static Future<void> initializeAllNotifications() async {
    try {
      AppLogs.infoLog('Initializing all notifications');

      await initializeLocalNotifications();
      await setupFirebaseMessaging();

      AppLogs.infoLog('All notifications initialized successfully');
    } catch (e) {
      // حتى لو فشلت التهيئة، سنسمح للتطبيق بالاستمرار
      AppLogs.errorLog('Error initializing notifications: $e');
      _showNotificationError(
          'حدث خطأ أثناء تهيئة الإشعارات، بعض الميزات قد لا تعمل بشكل صحيح.');
    }
  }

  /// تهيئة الإشعارات المحلية
  static Future<void> initializeLocalNotifications() async {
    try {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
      );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      AppLogs.infoLog('Local notifications initialized');
    } catch (e) {
      AppLogs.errorLog('Error initializing local notifications: $e');
      // نسمح للتطبيق بالاستمرار حتى مع فشل تهيئة الإشعارات المحلية
    }
  }

  /// عرض إشعار محلي
  static Future<void> showLocalNotification(String title, String body) async {
    // التحقق مما إذا كانت الإشعارات مفعلة
    if (!_notificationsEnabled) {
      AppLogs.infoLog(
          'Notifications are disabled, skipping local notification');
      return;
    }

    try {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'default_channel_id',
        'default_notifications',
        channelDescription: 'YourSeat channel ',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );

      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await _flutterLocalNotificationsPlugin.show(
        0, // notification ID
        title,
        body,
        platformChannelSpecifics,
        payload: 'Default_Sound',
      );

      AppLogs.infoLog('Local notification shown: $title - $body');
    } catch (e) {
      AppLogs.errorLog('Error showing local notification: $e');
      // نتجاهل الأخطاء ونسمح للتطبيق بالاستمرار
    }
  }

  /// إعداد إشعارات Firebase
  static Future<void> setupFirebaseMessaging() async {
    try {
      _messaging = FirebaseMessaging.instance;

      // طلب إذن الإشعارات
      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      // تحديث حالة الإشعارات بناءً على قرار المستخدم
      _notificationsEnabled =
          settings.authorizationStatus == AuthorizationStatus.authorized ||
              settings.authorizationStatus == AuthorizationStatus.provisional;

      AppLogs.infoLog(
          'Firebase Messaging permission: ${settings.authorizationStatus}');

      // إظهار رسالة إذا تم رفض إذن الإشعارات
      if (!_notificationsEnabled) {
        _showNotificationError(
            'تم رفض إذن الإشعارات. لن تتمكن من استلام التنبيهات.');
        return; // لا داعي لإكمال الإعداد إذا تم رفض الإذن
      }

      // الحصول على توكن الجهاز
      final token = await _messaging.getToken();
      AppLogs.debugLog('FCM Token: $token');

      // الاستماع للإشعارات أثناء تشغيل التطبيق
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        AppLogs.debugLog(
            'New message received: ${message.notification?.title}');
        if (message.notification != null) {
          showLocalNotification(
            message.notification!.title ?? 'New Message',
            message.notification!.body ?? '',
          );
        }
      });

      // الاستماع لفتح التطبيق من خلال إشعار
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        AppLogs.debugLog(
            'App opened via notification: ${message.notification?.title}');
        if (message.notification != null) {
          showLocalNotification(
            message.notification!.title ?? 'New Message',
            message.notification!.body ?? '',
          );
        }
      });
    } catch (e) {
      AppLogs.errorLog('Error setting up Firebase messaging: $e');
      _showNotificationError(
          'حدث خطأ أثناء إعداد الإشعارات، لن تتمكن من استلام التنبيهات.');
      _notificationsEnabled = false;
    }
  }

  /// ضبط معالج الإشعارات في الخلفية
  static Future<void> configureBackgroundHandler() async {
    try {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      AppLogs.infoLog('Background message handler configured');
    } catch (e) {
      AppLogs.errorLog('Error configuring background handler: $e');
      // نتجاهل الأخطاء ونسمح للتطبيق بالاستمرار
    }
  }

  /// معالج الإشعارات في الخلفية
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    AppLogs.debugLog(
        'Background message received: ${message.notification?.title}');

    // يمكن إضافة معالجة خاصة للإشعارات في الخلفية هنا
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
