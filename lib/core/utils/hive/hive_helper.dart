import 'package:hive_flutter/adapters.dart';

class HiveHelper {
  static const String boxName = 'user_datas';

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  static Future<void> putData(String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  static Future<dynamic>getData(String key) async {
    final box = Hive.box(boxName);
    return box.get(key);
  }
}
