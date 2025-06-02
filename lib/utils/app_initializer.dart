import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bot_toast/bot_toast.dart';
import '../data/hive_storage.dart';
import '../data/hive_keys.dart';
import 'app_logs.dart';
import 'firebase_manager.dart';
import 'notifications_manager.dart';
import 'permissions_manager.dart';

class AppInitializer {
  static bool _isAppInitialized = false;
  static bool _isStorageInitialized = false;

  static bool get isAppInitialized => _isAppInitialized;

  static bool get isStorageInitialized => _isStorageInitialized;

  static Future<void> initializeApp() async {
    _isAppInitialized = false;
    AppLogs.infoLog('Starting app initialization');

    // 1. ضبط توجيه الشاشة (ضروري)
    if (!await _safelySetScreenOrientation()) {
      // إذا فشل ضبط توجيه الشاشة، نحاول المتابعة على أي حال
      AppLogs.errorLog('Failed to set screen orientation, continuing anyway');
    }

    // 2. تهيئة التخزين المحلي (ضروري)
    if (!await _safelyInitializeLocalStorage()) {
      _showCriticalError(
          'فشل تهيئة التخزين المحلي. قد يواجه التطبيق مشاكل في الحفظ واستعادة البيانات.');
      // حتى مع فشل التخزين المحلي، نحاول المتابعة
    }

    // 3. طلب الأذونات
    // هذه الخطوة ليست ضرورية تمامًا، فيمكن للتطبيق العمل بدون بعض الأذونات
    await _safelyRequestPermissions();

    // 4. تهيئة Firebase
    // يمكن للتطبيق العمل بدون Firebase في الأوضاع الأساسية
    await _safelyInitializeFirebase();

    // 5. تهيئة الإشعارات
    // يمكن للتطبيق العمل بدون إشعارات
    await _safelyInitializeNotifications();

    _isAppInitialized = true;
    AppLogs.scussessLog('App initialization completed successfully');
  }

  /// ضبط توجيه الشاشة بأمان
  static Future<bool> _safelySetScreenOrientation() async {
    try {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      AppLogs.infoLog('Screen orientation set to portrait mode');
      return true;
    } catch (e) {
      AppLogs.errorLog('Error setting screen orientation: $e');
      return false;
    }
  }

  /// تهيئة التخزين المحلي وضبط القيم الافتراضية بأمان
  static Future<bool> _safelyInitializeLocalStorage() async {
    try {
      await HiveStorage.init();
      _isStorageInitialized = true;

      // تعيين القيم الافتراضية إذا لم تكن موجودة
      _safelySetDefaultValue(HiveKeys.isDark, true);
      _safelySetDefaultValue(HiveKeys.passUserOnboarding, false);
      _safelySetDefaultValue(HiveKeys.isArabic, false);

      AppLogs.infoLog('Local storage initialized with default values');
      return true;
    } catch (e) {
      _isStorageInitialized = false;
      AppLogs.errorLog('Error initializing local storage: $e');
      return false;
    }
  }

  /// طلب الأذونات بأمان
  static Future<void> _safelyRequestPermissions() async {
    try {
      await PermissionsManager.requestAllPermissions();
      AppLogs.infoLog('Permissions requested successfully');
    } catch (e) {
      AppLogs.errorLog('Error requesting permissions: $e');
      _showError(
          'حدث خطأ أثناء طلب الأذونات. بعض ميزات التطبيق قد لا تعمل بشكل صحيح.');
    }
  }

  /// تهيئة Firebase بأمان
  static Future<void> _safelyInitializeFirebase() async {
    try {
      await FirebaseManager.initializeFirebase();
      AppLogs.infoLog('Firebase initialized successfully');
    } catch (e) {
      AppLogs.errorLog('Error initializing Firebase: $e');
      _showError(
          'حدث خطأ أثناء تهيئة Firebase. بعض ميزات التطبيق قد لا تعمل بشكل صحيح.');
    }
  }

  /// تهيئة الإشعارات بأمان
  static Future<void> _safelyInitializeNotifications() async {
    try {
      await NotificationsManager.initializeAllNotifications();
      AppLogs.infoLog('Notifications initialized successfully');
    } catch (e) {
      AppLogs.errorLog('Error initializing notifications: $e');
      _showError('حدث خطأ أثناء تهيئة الإشعارات. قد لا تصلك إشعارات التطبيق.');
    }
  }

  /// تعيين قيمة افتراضية بأمان إذا لم تكن القيمة موجودة
  static void _safelySetDefaultValue(String key, dynamic defaultValue) {
    try {
      if (!_isStorageInitialized) return;

      if (HiveStorage.get(key) == null) {
        HiveStorage.set(key, defaultValue);
        AppLogs.debugLog('Set default value for $key: $defaultValue');
      }
    } catch (e) {
      AppLogs.errorLog('Error setting default value for $key: $e');
    }
  }

  /// عرض رسالة خطأ عادية
  static void _showError(String message) {
    BotToast.showText(
      text: message,
      duration: const Duration(seconds: 3),
      contentColor: Colors.orange,
      contentPadding: const EdgeInsets.all(10),
    );
  }

  /// عرض رسالة خطأ حرجة
  static void _showCriticalError(String message) {
    BotToast.showText(
      text: message,
      duration: const Duration(seconds: 5),
      contentColor: Colors.red[700]!,
      contentPadding: const EdgeInsets.all(10),
    );
  }
}
