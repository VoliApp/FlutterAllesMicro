import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voli/components/circularNetworkImage.dart';
import 'package:voli/models/allesUser.dart';
import 'package:voli/util/bottomToTopRoute.dart';
import 'package:voli/views/profile.dart';

void _openProfile(BuildContext context, String id) => Navigator.of(context)
    .push(BottomToTopRoute(builder: (context) => Profile(id)));

class PostComponentUser extends StatelessWidget {
  final AllesUser user;

  const PostComponentUser(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openProfile(context, user.id),
      child: Row(
        children: [
          CircularNetworkImage(
              "https://avatar.alles.cc/${user.id}?size=40", 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text("${user.nickname}${user.plus ? "\u207A" : ""}",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Text("${user.name}#${user.tag}",
                    style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          )
        ],
      ),
    );
  }
}
