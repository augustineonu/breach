import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final _box = GetStorage();

  static Future<void> saveToken(String token) async {
    await _box.write('token', token);
  }

  static String? getToken() {
    return _box.read('token');
  }

  static Future<void> clear() async {
    await _box.erase();
  }
}
