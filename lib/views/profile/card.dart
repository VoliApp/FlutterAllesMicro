import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:voli/models/allesUser.dart';
import 'package:voli/views/profile/blurredHeader.dart';
import 'package:voli/components/customIconButton.dart';
import 'package:voli/views/profile/info.dart';

void _close(BuildContext context) => Navigator.pop(context);

class ProfileCard extends StatelessWidget {
  final AllesUser user;

  ProfileCard(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
          child: Stack(
        children: [
          user != null
              ? Stack(
                  children: [
                    ProfileComponentBlurredHeader(
                        "https://avatar.alles.cc/${user.id}?size=100"),
                    ProfileComponentInfo(user)
                  ],
                )
              : Center(
                  child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomIconButton(
                circleDarkBackground: true,
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onTap: () => _close(context),
              ),
              CustomIconButton(
                circleDarkBackground: true,
                icon: Icon(Icons.share, color: Colors.white),
                onTap: () => Share.share("https://micro.alles.cx/${user.id}"),
              ),
            ],
          )
        ],
      )),
    );
  }
}
