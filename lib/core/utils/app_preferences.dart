import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences {
  // KEYS
  static const String _keyName = "name";
  static const String _keyAge = "age";
  static const String _keySalary = "salary";
  static const String _keyLanguage = "language";


  /// ---------- STRING ----------
  static Future<void> setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  /// ---------- INT ----------
  static Future<void> setAge(int age) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyAge, age);
  }

  static Future<int?> getAge() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyAge);
  }

  /// ---------- DOUBLE / FLOAT ----------
  static Future<void> setSalary(double salary) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keySalary, salary);
  }

  static Future<double?> getSalary() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keySalary);
  }

  /// ---------- LANGUAGE (STRING) ----------
static Future<void> setLanguage(String language) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_keyLanguage, language);
}

static Future<String?> getLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(_keyLanguage);
}

}
