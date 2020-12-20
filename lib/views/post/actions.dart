import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:voli/api/alles.dart';
import 'package:voli/models/allesPost.dart';
import 'package:voli/util/timeParser.dart';
import 'package:voli/util/topToBottomRoute.dart';
import 'package:voli/views/createPost.dart';

class PostComponentActions extends StatefulWidget {
  final String time;
  final Vote vote;
  final String postId;
  final int replies;

  const PostComponentActions(
      {Key key,
      @required this.time,
      @required this.vote,
      @required this.postId,
      @required this.replies})
      : super(key: key);

  @override
  _PostComponentActionsState createState() => _PostComponentActionsState();
}

class _PostComponentActionsState extends State<PostComponentActions> {
  int prevVote;
  int voted;
  int score;

  void vote(int id) async {
    setState(() {
      prevVote = voted;
      voted = id != voted ? id : 0;
    });
    // Send vote request
    bool isVoteSuccessful = await Alles.post.vote(widget.postId, id);
    // If the vote wasn't successful, don't show that the vote was casted.
    setState(() => voted = isVoteSuccessful ? voted : prevVote);
  }

  void share() => Share.share("https://micro.alles.cx/p/${widget.postId}");

  void reply() => Navigator.of(context).push(TopToBottomRoute(
      builder: (BuildContext context) => CreatePost(id: widget.postId)));

  @override
  void initState() {
    voted = widget.vote.me;
    score = widget.vote.score;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Negative vote
            IconButton(
                padding: const EdgeInsets.symmetric(vertical: 4),
                icon: Icon(Icons.remove),
                onPressed: () => vote(score != -1 ? -1 : 0),
                color: voted == -1
                    ? Colors.blue
                    : Theme.of(context).disabledColor),

            // Vote count
            Text(score.toString()),

            // Positive vote
            IconButton(
                padding: const EdgeInsets.symmetric(vertical: 4),
                icon: Icon(Icons.add),
                onPressed: () => vote(score != 1 ? 1 : 0),
                color:
                    voted == 1 ? Colors.red : Theme.of(context).disabledColor),

            // Reply
            IconButton(
                padding: const EdgeInsets.symmetric(vertical: 4),
                icon: Icon(Icons
                    .reply_outlined), // TODO: get current outlined icon because for some reason flutter has the old icon
                onPressed: reply),

            // Reply count
            Text(widget.replies.toString()),

            // Share
            IconButton(
                padding: const EdgeInsets.symmetric(vertical: 4),
                icon: Icon(Icons.share_outlined),
                onPressed: share)
          ],
        ),

        // Time ago
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(timeAgoFromUTC(widget.time)))
      ],
    );
  }
}
