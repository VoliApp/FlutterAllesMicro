import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final Color color;
  final bool outlined;
  final TextStyle textStyle;
  final bool fillSpace;

  const CustomButton(
      {Key key,
      this.onTap,
      this.text,
      this.textStyle,
      this.icon,
      this.color,
      this.fillSpace = true,
      this.outlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: outlined
                ? Colors.transparent
                : color == null ? Theme.of(context).accentColor : color,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color: outlined
                    ? Theme.of(context).textTheme.button.color
                    : Colors.transparent,
                width: 1)),
        alignment: fillSpace ? Alignment.center : null,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: icon == null ? 0 : null, child: Icon(icon)),
            if (text != null)
              Padding(
                  padding: EdgeInsets.fromLTRB(icon != null ? 8 : 0, 0, 0, 0),
                  child: Text(text,
                      style: textStyle == null
                          ? Theme.of(context).textTheme.button
                          : textStyle))
          ],
        ),
      ),
    );
  }
}
