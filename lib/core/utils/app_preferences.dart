// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class AppPreferences {
//   AppPreferences._();
//   // KEYS
//   static const String _keyName = "name";
//   static const String _keyAge = "age";
//   static const String _keySalary = "salary";
//   static const String _keyLanguage = "language";
//   static SharedPreferences? myinstance = null;
//
//
//   static Future<SharedPreferences> getinstance() async
//   {
//     if (myinstance != null){
//       return myinstance!;
//
//     }
//     myinstance = await SharedPreferences.getInstance();
//      return myinstance!;
//   }
//
//
//   /// ---------- STRING ----------
//   static Future<void> setName(String name) async {
//     // final prefs = await SharedPreferences.getInstance();
//     await myinstance!.setString(_keyName, name);
//   }
//
//   static Future<String?> getName() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_keyName);
//   }
//
//   /// ---------- INT ----------
//   static Future<void> setAge(int age) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(_keyAge, age);
//   }
//
//   static Future<int?> getAge() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(_keyAge);
//   }
//
//   /// ---------- DOUBLE / FLOAT ----------
//   static Future<void> setSalary(double salary) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setDouble(_keySalary, salary);
//   }
//
//   static Future<double?> getSalary() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getDouble(_keySalary);
//   }
//
//   /// ---------- LANGUAGE (STRING) ----------
// static Future<void> setLanguage(String language) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString(_keyLanguage, language);
// }
//
// static Future<String?> getLanguage() async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getString(_keyLanguage);
// }
//
// }


import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  AppPreferences._(); // private constructor

  static const String _keyName = "name";
  static const String _keyAge = "age";
  static const String _keySalary = "salary";
  static const String _keyLanguage = "language";

  static Future<void> _set(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    }
    else if (value is int) {
      await prefs.setInt(key, value);
    }
    else if (value is double) {
      await prefs.setDouble(key, value);
    }
    else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

  static Future<dynamic> _get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }


  static Future<void> setName(String name) async =>
      await _set(_keyName, name);

  static Future<String?> getName() async =>
      await _get(_keyName);

  static Future<void> setAge(int age) async =>
      await _set(_keyAge, age);

  static Future<int?> getAge() async =>
      await _get(_keyAge);

  static Future<void> setSalary(double salary) async =>
      await _set(_keySalary, salary);

  static Future<double?> getSalary() async =>
      await _get(_keySalary);

  static Future<void> setLanguage(String language) async =>
      await _set(_keyLanguage, language);

  static Future<String?> getLanguage() async =>
      await _get(_keyLanguage);

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
