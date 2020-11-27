import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voli/api/user.dart';
import 'package:voli/models/allesUser.dart';
import 'package:voli/preferences.dart';

import 'feed.dart';

class Alles {
  static Future<bool> login(String username, String password) async {
    List<String> usernameSplit = username.split('#');

    // Check if there's a username and tag, and that there isn't more than one #
    if (usernameSplit.length != 2) return false;

    // Check if password is not empty
    if (password.isEmpty) return false;

    // Check if tag is number
    try {
      int.parse(usernameSplit[1]);
    } catch (FormatException) {
      return false;
    }

    var request = await http.post('https://alles.cx/api/login', body: {
      'name': usernameSplit[0],
      'password': password,
      'tag': usernameSplit[1]
    });

    if (request.statusCode == 200) {
      var loginResponse = json.decode(request.body);
      if (loginResponse['token'] != null) {
        // We got a token, dab.
        Preferences.token = loginResponse['token'];
        // Get user's id
        AllesUser idrequest = await user.getMe();
        Preferences.id = idrequest.id;
        // Complete login
        return true;
      } else {
        // Request is successful but no token
        return false;
      }
    } else {
      // Request is unsuccessful
      return false;
    }
  }

  static User user = User();
  static Feed feed = Feed();
}
