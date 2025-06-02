import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'app_logs.dart';
import 'notifications_manager.dart';

/// فئة لإدارة خدمات Firebase
class FirebaseManager {
  static bool _isFirebaseInitialized = false;

  /// الحصول على حالة تهيئة Firebase
  static bool get isFirebaseInitialized => _isFirebaseInitialized;

  /// تهيئة جميع خدمات Firebase
  static Future<void> initializeFirebase() async {
    try {
      await _initializeFirebaseCore();
      await _initializeFirebaseAppCheck();
      await _configureMessagingBackgroundHandler();

      _isFirebaseInitialized = true;
      AppLogs.scussessLog('Firebase initialized successfully');
    } catch (e) {
      _isFirebaseInitialized = false;
      AppLogs.errorLog('Error initializing Firebase: $e');
      _showFirebaseError(
          'حدث خطأ أثناء تهيئة Firebase. بعض الميزات قد لا تعمل بشكل صحيح.');
      // نسمح للتطبيق بالاستمرار حتى مع حدوث خطأ في تهيئة Firebase
    }
  }

  /// تهيئة Firebase Core
  static Future<void> _initializeFirebaseCore() async {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyCREJCsFWlgq_kon3J8_Eu_mhvL0PUNGjs',
          appId: '1:556627768143:android:f217ff5d7d11f450b5cb3a',
          messagingSenderId: '556627768143',
          projectId: 'yourseatgraduationprojec-19068',
        ),
      );

      AppLogs.infoLog('Firebase Core initialized');
    } catch (e) {
      AppLogs.errorLog('Error initializing Firebase Core: $e');
      throw Exception('Firebase Core initialization failed: $e');
    }
  }

  /// تهيئة Firebase App Check
  static Future<void> _initializeFirebaseAppCheck() async {
    try {
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.debug,
      );

      AppLogs.infoLog('Firebase App Check activated');
    } catch (e) {
      AppLogs.errorLog('Error activating Firebase App Check: $e');
      _showFirebaseError(
          'فشل تفعيل Firebase App Check. سيستمر التطبيق ولكن قد تكون هناك قيود على بعض الميزات.');
      // لا نقوم بإعادة إرسال الخطأ لأن AppCheck ليس ضروريًا تمامًا للتطبيق
    }
  }

  /// إعداد معالج رسائل Firebase في الخلفية
  static Future<void> _configureMessagingBackgroundHandler() async {
    try {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      AppLogs.infoLog('Firebase Messaging background handler configured');
    } catch (e) {
      AppLogs.errorLog('Error configuring Messaging background handler: $e');
      // لا نقوم بإعادة إرسال الخطأ لأن معالج الرسائل في الخلفية ليس ضروريًا تمامًا للتطبيق
    }
  }

  /// معالج رسائل Firebase في الخلفية
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    try {
      // تهيئة الخدمات الضرورية للعمل في الخلفية
      await Firebase.initializeApp();

      // معالجة الإشعار باستخدام NotificationsManager
      await NotificationsManager.initializeLocalNotifications();

      if (message.notification != null) {
        await NotificationsManager.showLocalNotification(
          message.notification!.title ?? 'New Notification',
          message.notification!.body ?? '',
        );
      }

      AppLogs.debugLog('Handled background message: ${message.messageId}');
    } catch (e) {
      AppLogs.errorLog('Error handling background message: $e');
      // لا نستطيع عرض رسائل خطأ في الخلفية
    }
  }

  /// عرض رسالة خطأ للمستخدم
  static void _showFirebaseError(String message) {
    BotToast.showText(
      text: message,
      duration: const Duration(seconds: 3),
      contentColor: Colors.orange,
      contentPadding: const EdgeInsets.all(10),
    );
  }
}
