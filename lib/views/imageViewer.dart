import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:voli/components/customIconButton.dart';
import 'package:voli/util/imageUtils.dart';

class ImageViewer extends StatefulWidget {
  final String url;

  ImageViewer(this.url, {Key key}) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  Widget icon = Icon(Icons.save_outlined, color: Colors.white);

  void saveImage(BuildContext context, String url) async {
    setState(() => icon =
        SizedBox(height: 24, width: 24, child: CircularProgressIndicator()));
    Uint8List image = await ImageUtils().loadImage(widget.url);
    var wasSaved = await ImageUtils().saveImage(context, image);
    wasSaved = wasSaved != null ? wasSaved : false;
    setState(() => icon = Icon(wasSaved ? Icons.check : Icons.save_outlined,
        color: Colors.white));
    Scaffold.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content:
            Text(wasSaved ? "Saved" : "There was a problem saving the image")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ClipRRect(
              child: PhotoView(
                  loadingBuilder: (context, imageChunkBuilder) =>
                      Center(child: CircularProgressIndicator()),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  imageProvider: NetworkImage(widget.url)),
            ),

            // Top buttons
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Go back
                  CustomIconButton(
                    circleDarkBackground: true,
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onTap: () => Navigator.pop(context),
                  ),

                  // Share profile
                  CustomIconButton(
                    circleDarkBackground: true,
                    icon: icon,
                    onTap: () => saveImage(context, widget.url),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
