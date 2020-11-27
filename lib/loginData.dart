import 'package:voli/preferences.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool get isLoggedIn => Preferences.isLoggedIn;

  set isLoggedIn(bool value) {
    Preferences.isLoggedIn = value;
    notifyListeners();
  }
}
