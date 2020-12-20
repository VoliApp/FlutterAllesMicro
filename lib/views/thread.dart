import 'package:flutter/material.dart';
import 'package:voli/api/alles.dart';
import 'package:voli/models/allesPost.dart';
import 'package:voli/views/post/post.dart';

class Thread extends StatefulWidget {
  final AllesPost post;

  const Thread(this.post, {Key key}) : super(key: key);

  @override
  _ThreadState createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  AllesPost post;
  List<AllesPost> parents;
  List<AllesPost> children;

  @override
  void initState() {
    post = widget.post;
    // Get posts
    if (widget.post.parent != null) {
      Alles.feed.getParents(widget.post.parent).then((value) {
        setState(() => parents = value);
      });
    }
    if (widget.post.children.count != 0) {
      Alles.feed.getPostsList(widget.post.children.list).then((value) {
        setState(() => children = value);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Thread'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          // Parent posts
          widget.post.parent != null
              ? parents != null
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: parents.length,
                      itemBuilder: (context, index) =>
                          Post(parents[index], threadParent: true))
                  : Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(child: CircularProgressIndicator()))
              : SizedBox(height: 0),
          // Selected post
          Post(post, highlight: true),
          // Divider
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: double.infinity,
              height: widget.post.children.count != 0 ? 1 : 0,
              color: Theme.of(context).canvasColor,
            ),
          ),
          // Children posts
          widget.post.children.count != 0
              ? children != null
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: children.length,
                      itemBuilder: (context, index) => Post(children[index]))
                  : Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(child: CircularProgressIndicator()))
              : SizedBox(height: 0),
        ]))
      ],
    ));
  }
}
