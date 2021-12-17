import 'package:flutter/material.dart';
import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/http_service.dart';

class ArtViewPage extends StatefulWidget {
  const ArtViewPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ArtViewPage> createState() => _ArtViewPageState();
}

class _ArtViewPageState extends State<ArtViewPage> {
  Art art = Art("435874", "Mona Lisa, La Gioconda my love", "228", "Author",
      "https://cs1.livemaster.ru/storage/c0/7b/e335a5db05bd9a854e828041a4dt--kartiny-i-panno-mona-liza-leonardo-da-vinchi-ruchnaya-kopiya-.jpg");
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
            child: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
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
                    text: art.title,
                    children: [
                      TextSpan(
                        text: '\n' + art.author,
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
              background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(art.primaryImage),
                          fit: BoxFit.cover))),
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
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.7),
        //           spreadRadius: 70,
        //           blurRadius: 120,
        //           offset: Offset(10, 50), // changes position of shadow
        //         ),
        //       ],
        //     ),
        //     child: Text.rich(
        //       TextSpan(
        //         text: art.title,
        //         children: [
        //           TextSpan(
        //             text: '\n' + art.author,
        //             style: const TextStyle(
        //               fontWeight: FontWeight.w300,
        //               color: Colors.white,
        //               fontSize: 15,
        //             ),
        //           ),
        //         ],
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white,
        //           fontSize: 20,
        //         ),
        //       ),
        //       textAlign: TextAlign.left,
        //     ),
        //   ),
        // ),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          //height: 700.0,
          //alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                  text: 'Overview',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 25,
                  ),
                )),

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
                  text: '1616 - 1617',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),

                // ------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: art.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),
                //---------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Country of origin',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                )),
                SizedBox(height: 3),
                Text.rich(TextSpan(
                  text: 'Dutch',
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
                  text: 'Oil on canvas',
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
                  text: '51 3/4 x 39 1/4 in. (131.4 x 99.7 cm)',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )),
                //------
                SizedBox(height: 30),
                Text.rich(TextSpan(
                  text: 'Similar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 25,
                  ),
                )),
              ],
            ),
          ),
        ),
      ]))
    ]));
  }
}
