import 'package:flutter/material.dart';

class ProfileComponentFollowsYou extends StatelessWidget {
  const ProfileComponentFollowsYou({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).textTheme.headline1.color),
          borderRadius: BorderRadius.circular(100)),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text('Follows you'),
    );
  }
}
