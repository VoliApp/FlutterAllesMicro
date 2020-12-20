import 'package:flutter/material.dart';

class CircularNetworkImage extends StatelessWidget {
  final double size;
  final String imageUrl;
  final double borderWidth;

  const CircularNetworkImage(this.imageUrl, this.size,
      {Key key, this.borderWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(imageUrl)),
            border: Border.all(
                color: borderWidth != null
                    ? Colors.green.shade900
                    : Colors.transparent,
                width: borderWidth != null ? borderWidth : 0)),
      ),
    );
  }
}
