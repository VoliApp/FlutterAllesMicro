import 'package:flutter/material.dart';

class CustomDialog {
  final BuildContext context;
  final Widget icon;
  final String title;
  final String body;
  final List<String> actions;

  CustomDialog({this.context, this.title, this.icon, this.body, this.actions});

  Future<int> show() {
    return showDialog<int>(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
                    child: Column(
                      children: [
                        icon,
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                          child: Text(title,
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        Text(body, style: Theme.of(context).textTheme.bodyText2)
                      ],
                    ),
                  ),

                  // Actions
                  Container(
                    height: ((actions.length * 55) + (actions.length - 1))
                        .toDouble(),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                          height: 1, color: Theme.of(context).dividerColor),
                      itemCount: actions.length,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.pop(context, index),
                          child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              padding: EdgeInsets.all(8),
                              child: Text(actions[index],
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor)))),
                    ),
                  )
                ],
              )));
        });
  }
}
