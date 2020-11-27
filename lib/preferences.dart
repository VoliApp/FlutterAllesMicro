import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences _prefs;

  static Future init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  static bool get isLoggedIn => _prefs.getBool("is_logged_in") ?? false;
  static set isLoggedIn(bool value) => _prefs.setBool("is_logged_in", value);

  static String get token => _prefs.getString("token");
  static set token(String value) => _prefs.setString("token", value);

  static String get id => _prefs.getString("id");
  static set id(String value) => _prefs.setString("id", value);

  static int get theme => _prefs.getInt("theme") ?? 0;
  static set theme(int value) => _prefs.setInt("theme", value);

  static Color get accentColor {
    var data = _prefs.getString("accent_color");
    if (data != null) {
      return Color(int.parse(data, radix: 16));
    }
    return null;
  }

  static set accentColor(Color value) =>
      _prefs.setString("accent_color", value.value.toRadixString(16));
}
