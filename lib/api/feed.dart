import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voli/models/allesPost.dart';
import 'package:voli/preferences.dart';

class Feed {
  Future<List<AllesPost>> getTimeline() async {
    var request = await http.get('https://micro.alles.cx/api/feed',
        headers: {'Authorization': Preferences.token});
    if (request.statusCode == 200) {
      return (await getPostsList(json.decode(request.body)['posts']));
      //return compute(getPostsList, json.decode(request.body)['posts']);
    } else {
      return null;
    }
  }

  /// ids = List<String>
  Future<List<AllesPost>> getPostsList(List<dynamic> ids) async {
    return await Future.wait(ids.map((id) => getPost(id)));
  }

  Future<AllesPost> getPost(String id) async {
    var request = await http.get('https://micro.alles.cx/api/posts/$id',
        headers: {'Authorization': Preferences.token});
    if (request.statusCode == 200) {
      return AllesPost.fromJson(json.decode(request.body));
    } else {
      return null;
    }
  }
}
