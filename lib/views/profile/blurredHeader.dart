import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileComponentBlurredHeader extends StatelessWidget {
  final String imageUrl;

  const ProfileComponentBlurredHeader(this.imageUrl, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        child: Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
            ),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.black.withOpacity(0)))));
  }
}
