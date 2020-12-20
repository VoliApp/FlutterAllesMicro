import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:voli/components/card.dart';
import 'package:voli/components/customIconButton.dart';
import 'package:voli/models/allesUser.dart';
import 'package:voli/views/profile/blurredHeader.dart';
import 'package:voli/views/profile/info.dart';

void _close(BuildContext context) => Navigator.pop(context);

class ProfileCard extends StatelessWidget {
  final AllesUser user;

  ProfileCard(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VoliCard(
        topPadding: 16,
        bottomPadding: 4,
        highlight: true,
        child: Stack(
          children: [
            user != null
                ? Stack(
                    children: [
                      // Banner
                      ProfileComponentBlurredHeader(
                          "https://avatar.alles.cc/${user.id}?size=100"),
                      // Info
                      ProfileComponentInfo(user)
                    ],
                  )
                // Loading indicator
                : Center(
                    child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  )),

            // Top buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Go back
                CustomIconButton(
                  circleDarkBackground: true,
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onTap: () => _close(context),
                ),

                // Share profile
                CustomIconButton(
                  circleDarkBackground: true,
                  icon: Icon(Icons.share_outlined, color: Colors.white),
                  onTap: () => Share.share("https://micro.alles.cx/${user.id}"),
                ),
              ],
            )
          ],
        ));
  }
}
