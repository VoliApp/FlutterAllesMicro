import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final bool circleDarkBackground;
  final double padding;

  const CustomIconButton(
      {Key key,
      @required this.icon,
      this.onTap,
      this.circleDarkBackground = false,
      this.padding = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
              color: circleDarkBackground ? Colors.black45 : Colors.transparent,
              borderRadius: BorderRadius.circular(100)),
          padding: EdgeInsets.all(8),
          child: FittedBox(child: icon, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
