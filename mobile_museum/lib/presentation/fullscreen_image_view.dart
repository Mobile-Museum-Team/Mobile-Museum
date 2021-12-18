import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullsreenImageView extends StatefulWidget {
  const FullsreenImageView({Key? key, required this.link}) : super(key: key);
  final String link;
  @override
  _FullsreenImageViewState createState() => _FullsreenImageViewState();
}

class _FullsreenImageViewState extends State<FullsreenImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        transitionOnUserGestures: true,
        tag: widget.link,
        child: Dismissible(
          direction: DismissDirection.vertical,
          key: const Key('key'),
          onDismissed: (_) => Navigator.of(context).pop(),
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(widget.link),
            //CachedNetworkImage(imageUrl: widget.link),
            loadingBuilder: (context, progress) => Center(
              child: Container(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(),
              ),
              /*image: DecorationImage(
                  image:
                      new CachedNetworkImageProvider(widget.art.primaryImage),
                  fit: BoxFit.cover,
                ),*/
            ),
          ),
        ),
      ),
    );
  }
}
