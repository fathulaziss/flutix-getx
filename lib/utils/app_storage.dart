import 'package:get_storage/get_storage.dart';

class AppStorage {
  static Future write({required String key, required String value}) async {
    await GetStorage().write(key, value);
  }

  static Future<String> read({required String key}) async {
    final s = await GetStorage().read(key);
    return s ?? '';
  }

  static Future delete({required String key}) async {
    await GetStorage().remove(key);
  }

  static Future<bool> isContain({required String key}) async {
    final s = GetStorage().hasData(key);
    return s;
  }
}
