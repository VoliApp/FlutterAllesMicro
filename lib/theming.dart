import 'package:voli/preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int get theme => Preferences.theme;

  set theme(int value) {
    Preferences.theme = value;
    notifyListeners();
  }

  Color accentColor = Preferences.accentColor ?? Color(0xFF4C8BF5);

  void changeAccent(Color color) {
    accentColor = color;
    Preferences.accentColor = color;
    notifyListeners();
  }

  ThemeData get(bool darkTheme) => ThemeData(
      brightness: darkTheme ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor:
          darkTheme ? Color(0xFF121212) : Color(0xFFF5F5F5),

      // card outline
      canvasColor: darkTheme ? Color(0xFF393939) : Color(0xFFC5C5C5),
      cardColor: darkTheme ? Color(0xFF212121) : Colors.white,
      cardTheme: CardTheme(
        elevation: 0,
        color: darkTheme ? Color(0x12E0E0E0) : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
                color: darkTheme ? Color(0xFF393939) : Color(0xFFC5C5C5),
                width: 1)),
      ),
      disabledColor: Color(0xFF888888),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: darkTheme ? Color(0xFF121212) : Color(0xFFF5F5F5),
          selectedItemColor: accentColor,
          unselectedItemColor: Color(0xFF888888)),
      dividerColor: darkTheme ? Color(0xFF393939) : Colors.grey,
      accentColor: accentColor,
      dialogBackgroundColor: Colors.grey[darkTheme ? 900 : 50],
      primaryIconTheme:
          IconThemeData(color: darkTheme ? Color(0xFFE0E0E0) : Colors.black),
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: darkTheme ? Color(0xFF121212) : Color(0xFFF5F5F5),
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: darkTheme ? Color(0xFFE0E0E0) : Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20))),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: accentColor),
      textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: darkTheme ? Color(0xFFE0E0E0) : Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: darkTheme ? Color(0xFFE0E0E0) : Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: darkTheme ? Color(0xFFE0E0E0) : Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: darkTheme ? Color(0xFFE0E0E0) : Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: darkTheme ? Color(0xFFE0E0E0) : Colors.black,
          ),
          button: TextStyle(
            fontSize: 14,
            color: Colors.white,
          )));
}
