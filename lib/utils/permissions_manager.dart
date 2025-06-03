import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app_logs.dart';

/// فئة لإدارة أذونات التطبيق
class PermissionsManager {
  /// طلب جميع الأذونات الأساسية للتطبيق
  static Future<void> requestAllPermissions() async {
    await requestBasicPermissions();
    await requestCameraAndLocationPermissions();
  }

  /// طلب الأذونات الأساسية
  static Future<void> requestBasicPermissions() async {
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.location.request();
    AppLogs.infoLog('Basic permissions requested');
  }

  /// طلب أذونات الكاميرا والموقع مع إظهار رسائل حالة
  static Future<void> requestCameraAndLocationPermissions() async {
    // طلب إذن الكاميرا
    final cameraStatus = await Permission.camera.request();
    _logPermissionStatus('Camera', cameraStatus);

    if (cameraStatus.isPermanentlyDenied) {
      AppLogs.errorLog('Camera permission permanently denied');
      await openAppSettings();
    }

    // طلب إذن الموقع
    final locationStatus = await Permission.locationWhenInUse.request();
    _logPermissionStatus('Location', locationStatus);

    if (locationStatus.isPermanentlyDenied) {
      AppLogs.errorLog('Location permission permanently denied');
      await openAppSettings();
    }
  }

  /// التحقق من خدمة الموقع وطلب الإذن إذا لزم الأمر
  static Future<bool> checkAndRequestLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppLogs.errorLog('Location services are disabled');
      await Geolocator.openLocationSettings();
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppLogs.errorLog('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppLogs.errorLog('Location permissions are permanently denied');
      await Geolocator.openAppSettings();
      return false;
    }

    return true;
  }

  /// الحصول على الموقع الحالي للمستخدم
  static Future<Position?> getUserLocation() async {
    try {
      if (await checkAndRequestLocationService()) {
        return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      }
    } catch (e) {
      AppLogs.errorLog('Error getting location: $e');
    }
    return null;
  }

  /// تسجيل حالة الإذن في سجل التطبيق
  static void _logPermissionStatus(
      String permissionName, PermissionStatus status) {
    if (status.isGranted) {
      AppLogs.scussessLog('$permissionName permission granted');
    } else if (status.isDenied) {
      AppLogs.errorLog('$permissionName permission denied');
    } else if (status.isPermanentlyDenied) {
      AppLogs.errorLog('$permissionName permission permanently denied');
    }
  }
}
