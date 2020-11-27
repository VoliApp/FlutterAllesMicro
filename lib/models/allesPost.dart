import 'allesUser.dart';

class AllesPost {
  String id;
  AllesUser author;
  String parent;
  Children children;
  String content;
  String image;
  String url;
  Vote vote;
  int interactions;
  String createdAt;

  AllesPost(
      {this.id,
      this.author,
      this.parent,
      this.children,
      this.content,
      this.image,
      this.url,
      this.vote,
      this.interactions,
      this.createdAt});

  AllesPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author =
        json['author'] != null ? new AllesUser.fromJson(json['author']) : null;
    parent = json['parent'];
    children = json['children'] != null
        ? new Children.fromJson(json['children'])
        : null;
    content = json['content'];
    image = json['image'];
    url = json['url'];
    vote = json['vote'] != null ? new Vote.fromJson(json['vote']) : null;
    interactions = json['interactions'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['parent'] = this.parent;
    if (this.children != null) {
      data['children'] = this.children.toJson();
    }
    data['content'] = this.content;
    data['image'] = this.image;
    data['url'] = this.url;
    if (this.vote != null) {
      data['vote'] = this.vote.toJson();
    }
    data['interactions'] = this.interactions;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Children {
  List<String> list;
  int count;

  Children({this.list, this.count});

  Children.fromJson(Map<String, dynamic> json) {
    list = json['list'].cast<String>();
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this.list;
    data['count'] = this.count;
    return data;
  }
}

class Vote {
  int score;
  int me;

  Vote({this.score, this.me});

  Vote.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    me = json['me'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['me'] = this.me;
    return data;
  }
}
