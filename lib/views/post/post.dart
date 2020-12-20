import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voli/models/allesPost.dart';
import 'package:voli/util/bottomToTopRoute.dart';
import 'package:voli/views/imageViewer.dart';
import 'package:voli/views/post/actions.dart';
import 'package:voli/views/post/user.dart';
import 'package:voli/views/thread.dart';

class Post extends StatelessWidget {
  final AllesPost post;
  // If this is a child, add a line at the top of the card
  final bool threadChild;
  // If this is a parent, add a line at the bottom of the card
  final bool threadParent;
  // Is this post the main one?
  final bool highlight;

  const Post(this.post,
      {Key key, this.threadChild, this.threadParent, this.highlight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            height: threadParent ?? false ? 0 : 4,
            width: 4,
            decoration: BoxDecoration(
                color: threadChild ?? false
                    ? Theme.of(context).canvasColor
                    : Colors.transparent),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: highlight ?? false
                    ? SweepGradient(colors: [
                        Colors.red,
                        Colors.blue,
                        Colors.purple,
                        Colors.indigo,
                        Colors.pink,
                        Colors.green,
                        Colors.yellow,
                        Colors.orange
                      ])
                    : null,
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(11)),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => Navigator.push(context,
                    BottomToTopRoute(builder: (context) => Thread(post))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User info
                    Padding(
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                        child: PostComponentUser(post.author)),
                    post.content.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                            child: Text(post.content,
                                style: Theme.of(context).textTheme.bodyText2),
                          )
                        : SizedBox(height: 0),

                    // Image
                    post.image != null
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    BottomToTopRoute(
                                        builder: (context) => ImageViewer(
                                            "https://walnut1.alles.cc/${post.image}"))),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "https://walnut1.alles.cc/${post.image}",
                                    fit: BoxFit.cover)))
                        : SizedBox(height: 0),

                    // Link
                    post.url != null
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => launch(post.url),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).disabledColor,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(16)),
                                padding: EdgeInsets.all(8),
                                child: Text(post.url,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline)),
                              ),
                            ))
                        : SizedBox(height: 0),

                    // Actions
                    PostComponentActions(
                        time: post.createdAt,
                        vote: post.vote,
                        postId: post.id,
                        replies: post.children.count)
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: threadParent ?? false ? 8 : 4,
            width: 4,
            decoration: BoxDecoration(
                color: threadParent ?? false
                    ? Theme.of(context).cardColor
                    : Colors.transparent),
          ),
        ],
      ),
    );
  }
}
