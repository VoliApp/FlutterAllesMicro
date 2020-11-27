import 'package:flutter/material.dart';
import 'package:voli/api/alles.dart';
import 'package:voli/views/post/post.dart';
import 'package:voli/views/profile/card.dart';

class Profile extends StatefulWidget {
  final String id;

  const Profile(this.id, {Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Widget> list = [ProfileCard(null)];

  @override
  void initState() {
    super.initState();
    Alles.user.getUser(widget.id).then((value) {
      list = [ProfileCard(value)];
      Alles.feed.getPostsList(value.posts.recent).then((posts) {
        List<Widget> newposts = [];
        posts.forEach((it) => newposts.add(Post(it)));
        setState(() => list.addAll(newposts));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: list,
      ),
    );
  }
}
