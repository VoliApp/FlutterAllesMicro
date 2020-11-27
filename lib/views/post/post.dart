import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voli/models/allesPost.dart';
import 'package:voli/views/post/actions.dart';
import 'package:voli/views/post/user.dart';

class Post extends StatelessWidget {
  final AllesPost post;

  const Post(this.post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            post.image != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: GestureDetector(
                        onTap: () {},
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CachedNetworkImage(
                              imageUrl:
                                  "https://walnut1.alles.cc/${post.image}",
                              fit: BoxFit.cover),
                        )))
                : SizedBox(height: 0),
            post.url != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                    child: InkWell(
                      onTap: () => launch(post.url),
                      child: Container(
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
                                    decoration: TextDecoration.underline)),
                      ),
                    ))
                : SizedBox(height: 0),
            PostComponentActions(
                time: post.createdAt,
                vote: post.vote,
                postId: post.id,
                replies: post.children.count)
          ],
        ),
      ),
    );
  }
}
