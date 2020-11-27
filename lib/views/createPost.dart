import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  final String id;

  CreatePost({Key key, this.id}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool sending = false;
  final TextEditingController textEditingController = TextEditingController();

  void send() {
    // todo
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: widget.id != null ? Text("Reply") : null,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            sending
                ? Padding(
                    padding: EdgeInsets.all(4),
                    child: CircularProgressIndicator())
                : IconButton(
                    icon: Icon(Icons.send_outlined),
                    onPressed: send,
                  )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    maxLines: null,
                    expands: true,
                    autofocus: true,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        hintText: 'What\'s up?',
                        border: InputBorder.none,
                        labelStyle: Theme.of(context).textTheme.bodyText2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_a_photo_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.link),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
