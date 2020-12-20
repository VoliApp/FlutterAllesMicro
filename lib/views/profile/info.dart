import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voli/components/circularNetworkImage.dart';
import 'package:voli/components/customButton.dart';
import 'package:voli/models/allesUser.dart';
import 'package:voli/preferences.dart';

import 'followsYou.dart';

class ProfileComponentInfo extends StatefulWidget {
  final AllesUser user;

  ProfileComponentInfo(this.user, {Key key}) : super(key: key);

  @override
  _ProfileComponentInfoState createState() => _ProfileComponentInfoState();
}

class _ProfileComponentInfoState extends State<ProfileComponentInfo> {
  bool _following;

  void _switchFollow() => setState(() => _following = !_following);

  @override
  void initState() {
    _following = widget.user.followers.me;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
              child: Column(
                children: [
                  CircularNetworkImage(
                      "https://avatar.alles.cc/${widget.user.id}?size=100",
                      100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.user.nickname,
                          style: Theme.of(context).textTheme.headline2),
                      Text("#${widget.user.tag}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.blue)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // If the user doesn't have an username, don't show it.
                      widget.user.username != null
                          ? Row(
                              children: [
                                Text(widget.user.username,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                if (widget.user.following.me) SizedBox(width: 8)
                              ],
                            )
                          : SizedBox(height: 0),

                      // If the user follows the viewer, show the Follows you tag
                      if (widget.user.following.me)
                        ProfileComponentFollowsYou(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text('${widget.user.followers.count} followers'),
                  ),
                  // If we're showing the user's profile, don't show the follow button
                  Preferences.id != widget.user.id
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: CustomButton(
                              fillSpace: false,
                              text: _following ? 'Unfollow' : 'Follow',
                              outlined: !_following,
                              onTap: _switchFollow,
                              color: Theme.of(context).accentColor),
                        )
                      : SizedBox(height: 0)
                ],
              )),
        )
      ],
    );
  }
}
