import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/logic/api/http_service.dart';
import 'package:mobile_museum/presentation/fullscreen_image_view.dart';

class ArtViewPage extends StatefulWidget {
  const ArtViewPage({Key? key, required this.art}) : super(key: key);
  final Art art;

  @override
  State<ArtViewPage> createState() => _ArtViewPageState();
}

class _ArtViewPageState extends State<ArtViewPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    //httpService.htmlParser(art);
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        pinned: false,
        snap: false,
        floating: false,
        stretch: true,
        expandedHeight: 450.0,
        leadingWidth: 0,
        flexibleSpace: Stack(children: [
          Positioned(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        FullsreenImageView(link: widget.art.primaryImage),
                  ),
                );
              },
              child: FlexibleSpaceBar(
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                titlePadding:
                    EdgeInsetsDirectional.only(start: 30, end: 10, bottom: 40),
                centerTitle: false,
                title: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 70,
                        blurRadius: 120,
                        offset: Offset(10, 50), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: widget.art.title,
                      children: [
                        TextSpan(
                          text: '\n' + widget.art.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                background: Hero(
                  tag: widget.art.primaryImage,
                  child: DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.art.primaryImage),
                              fit: BoxFit.cover))),
                ),
              ),
            ),
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
          ),
          Positioned(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
            ),
            bottom: -1,
            left: 0,
            right: 0,
          ),
        ]),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          //height: 700.0,
          //alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text.rich(TextSpan(
                    text: 'Overview',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 25,
                    ),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconToggleButton(
                          isSelected: isSelected,
                          onPressed: () {
                            setState(
                              () {
                                isSelected = !isSelected;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ]),

                // ------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Years',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: widget.art.date,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),

                // ------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Artist Bio',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: widget.art.artistBio,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),
                // ------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Medium',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: widget.art.medium,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),
                // ------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Dimensions',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: widget.art.dimensions,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),
                //-------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: 'Metropolitan Museum of Art, NY',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),
                //---------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Credit',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: widget.art.creditLine,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),

                SizedBox(height: 60),
                //------
                // SizedBox(height: 30),
                // Text.rich(TextSpan(
                //   text: 'Similar',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black87,
                //     fontSize: 25,
                //   ),
                // )),
              ],
            ),
          ),
        ),
      ]))
    ]));
  }
}

class IconToggleButton extends StatelessWidget {
  final bool isSelected;
  final Function onPressed;
  IconToggleButton({required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: IconButton(
        iconSize: 30.0,
        color: Colors.black87,
        disabledColor: Colors.black87,
        splashColor: Colors.red,
        highlightColor: Colors.black87,
        padding: EdgeInsets.all(5),
        icon: Padding(
            padding: EdgeInsets.zero,
            child: isSelected == true
                ? Icon(Icons.star_sharp)
                : Icon(Icons.star_border_outlined)),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
