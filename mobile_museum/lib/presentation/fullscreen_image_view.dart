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
    return Container(
        child: PhotoView(
      imageProvider: NetworkImage(widget.link),
    ));
  }
}
