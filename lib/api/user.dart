import 'dart:convert';

import 'package:voli/models/allesUser.dart';

import 'package:http/http.dart' as http;
import 'package:voli/preferences.dart';

class User {
  Future<AllesUser> getUser(String id) async {
    var request = await http.get("https://micro.alles.cx/api/users/$id",
        headers: {"Authorization": Preferences.token});
    if (request.statusCode == 200) {
      return AllesUser.fromJson(json.decode(request.body));
    } else {
      return null;
    }
  }

  Future<AllesUser> getMe() async {
    var request = await http.get("https://micro.alles.cx/api/me",
        headers: {"Authorization": Preferences.token});
    if (request.statusCode == 200) {
      return AllesUser.fromJson(json.decode(request.body));
    } else {
      return null;
    }
  }
}
