import 'package:flutter/material.dart';
import 'package:voli/api/alles.dart';
import 'package:voli/components/circularNetworkImage.dart';
import 'package:voli/util/bottomToTopRoute.dart';
import 'package:voli/views/post/post.dart';
import 'package:voli/views/profile.dart';

import '../../preferences.dart';

class Start extends StatelessWidget {
  const Start({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: CircularNetworkImage(
                  "https://avatar.alles.cc/${Preferences.id}?size=35", 35),
              onPressed: () => Navigator.of(context).push(BottomToTopRoute(
                  builder: (context) => Profile(Preferences.id))))
        ],
      ),
      body: FutureBuilder(
          future: Alles.feed.getTimeline(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => Post(snapshot.data[index]),
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
