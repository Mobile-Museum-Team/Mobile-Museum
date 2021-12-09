import 'package:flutter/material.dart';
import 'art.dart';

class ArtItem extends StatefulWidget {
  final String title;
  final String pictureURL;
  final String id;

  ArtItem(this.id, this.title, this.pictureURL);

  @override
  State<ArtItem> createState() {
    return ArtItemState();
  }
}

class ArtItemState extends State<ArtItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 180,
        width: 170,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(2, 5),
                    ),
                  ],
                  //color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(widget.pictureURL),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0, 0.7, 1],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
