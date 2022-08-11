import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Keystore{

  static writeValue(String key, String? value) async {

    final storage = FlutterSecureStorage();
    var result = await storage.write(key: key, value: value);

    return result;
  }

  static Future<dynamic> readValue(String key) async{
    String? value;
    try {
      const storage = FlutterSecureStorage();
      value = await storage.read(key: key);
    } on Exception catch (exception) {
      print("Exception => Keystore : $exception");
      return null;
    } catch (error) {
      print("Error => Keystore : $error");
      return null;
    }
    return value;
  }

  static deleteValue(String key) async {

    const storage = FlutterSecureStorage();
    var result = await storage.delete(key: key);

    return result;

  }

  static readAllValues() async {

    const storage = FlutterSecureStorage();
    Map<String, String> result = await storage.readAll();

    return result;
  }

  static deleteAllValues() async {

    const storage = FlutterSecureStorage();
    var result = await storage.deleteAll();

    return result;

  }
}