import 'package:http/http.dart' as http;
import 'package:voli/preferences.dart';

class Post {
  Future<bool> vote(String id, int vote) async {
    var request = await http.post("https://micro.alles.cx/api/posts/$id/vote",
        headers: {
          'Authorization': Preferences.token,
          'content-type': 'application/json'
        },
        body: '{"vote": $vote}');

    // If the request is successful, we suppose that the vote was done
    return request.statusCode == 200;
  }
}
