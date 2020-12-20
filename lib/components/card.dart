import 'package:flutter/material.dart';

final _gradient = SweepGradient(colors: [
  Colors.red,
  Colors.blue,
  Colors.purple,
  Colors.indigo,
  Colors.pink,
  Colors.green,
  Colors.yellow,
  Colors.orange
]);

final _borderRadius = BorderRadius.circular(11);

class VoliCard extends StatelessWidget {
  final Widget child;

  /// Rainbow border to card
  final bool highlight;
  final VoidCallback onTap;

  /// If this is a child, add a line at the top of the card
  final bool threadChild;

  /// If this is a parent, add a line at the bottom of the card
  final bool threadParent;

  final double topPadding;
  final double bottomPadding;

  const VoliCard(
      {Key key,
      this.highlight,
      this.onTap,
      this.threadChild,
      this.threadParent,
      this.bottomPadding,
      this.topPadding,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: topPadding ?? 4,
              width: 4,
              decoration: BoxDecoration(
                  color: threadChild ?? false
                      ? Theme.of(context).canvasColor
                      : Colors.transparent),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: highlight ?? false ? _gradient : null,
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(borderRadius: _borderRadius),
                child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: _borderRadius,
                    child: Material(
                        color: Theme.of(context).cardColor,
                        child: InkWell(
                            onTap: onTap,
                            borderRadius: _borderRadius,
                            child: child))),
              ),
            ),
            Container(
              height: bottomPadding ?? 4,
              width: 4,
              decoration: BoxDecoration(
                  color: threadParent ?? false
                      ? Theme.of(context).canvasColor
                      : Colors.transparent),
            ),
          ],
        ));
  }
}
