import 'package:hive_flutter/adapters.dart';

class HiveStorage {
  static late Box box;

  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('myBox');
  }

  static dynamic get(String key) {
    try {
      return box.get(key, defaultValue: null);
    } catch (e) {
      return null;
    }
  }

  static Future<void> set(String key, dynamic value) async {
    box.put(key, value);
  }

  static Future<void> remove(String key) async {
    box.delete(key);
  }

  static Future<void> clear() async {
    box.clear();
  }
}