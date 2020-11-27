import 'package:flutter/material.dart';

class TopToBottomRoute extends PageRoute<void> {
  TopToBottomRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);
  final WidgetBuilder builder;

  @override
  bool get opaque => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
          .chain(CurveTween(curve: Curves.fastOutSlowIn))
          .animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}
