class AllesUser {
  String id;
  String name;
  String tag;
  bool plus;
  String nickname;
  String username;
  String createdAt;
  Xp xp;
  Posts posts;
  Follows followers;
  Follows following;

  AllesUser(
      {this.id,
      this.name,
      this.tag,
      this.plus,
      this.nickname,
      this.username,
      this.createdAt,
      this.xp,
      this.posts,
      this.followers,
      this.following});

  AllesUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    plus = json['plus'];
    nickname = json['nickname'];
    username = json['username'];
    createdAt = json['createdAt'];
    xp = json['xp'] != null ? new Xp.fromJson(json['xp']) : null;
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
    followers = json['followers'] != null
        ? new Follows.fromJson(json['followers'])
        : null;
    following = json['following'] != null
        ? new Follows.fromJson(json['following'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tag'] = this.tag;
    data['plus'] = this.plus;
    data['nickname'] = this.nickname;
    data['username'] = this.username;
    data['createdAt'] = this.createdAt;
    if (this.xp != null) {
      data['xp'] = this.xp.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    if (this.followers != null) {
      data['followers'] = this.followers.toJson();
    }
    if (this.following != null) {
      data['following'] = this.following.toJson();
    }
    return data;
  }
}

class Xp {
  int total;
  int level;
  int levelXp;
  int levelXpMax;
  double levelProgress;

  Xp(
      {this.total,
      this.level,
      this.levelXp,
      this.levelXpMax,
      this.levelProgress});

  Xp.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    level = json['level'];
    levelXp = json['levelXp'];
    levelXpMax = json['levelXpMax'];
    levelProgress = json['levelProgress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['level'] = this.level;
    data['levelXp'] = this.levelXp;
    data['levelXpMax'] = this.levelXpMax;
    data['levelProgress'] = this.levelProgress;
    return data;
  }
}

class Posts {
  List<String> recent;
  int count;
  int replies;

  Posts({this.recent, this.count, this.replies});

  Posts.fromJson(Map<String, dynamic> json) {
    recent = json['recent'].cast<String>();
    count = json['count'];
    replies = json['replies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recent'] = this.recent;
    data['count'] = this.count;
    data['replies'] = this.replies;
    return data;
  }
}

class Follows {
  int count;
  bool me;

  Follows({this.count, this.me});

  Follows.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    me = json['me'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['me'] = this.me;
    return data;
  }
}
