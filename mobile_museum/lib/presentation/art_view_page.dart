import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/logic/api/http_service.dart';

class ArtViewPage extends StatefulWidget {
  const ArtViewPage({Key? key, required this.art}) : super(key: key);
  final Art art;

  @override
  State<ArtViewPage> createState() => _ArtViewPageState();
}

class _ArtViewPageState extends State<ArtViewPage> {
  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    //httpService.htmlParser(art);
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        new CachedNetworkImageProvider(widget.art.primaryImage),
                    //"https://www.rostmuseum.ru/upload/iblock/f9a/f9a2f70111b8d28f1b41e3fa3a63bacf.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 350,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            spreadRadius: 70,
                            blurRadius: 120,
                            offset:
                                Offset(10, 50), // changes position of shadow
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
                                fontSize: 15,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    height: 700.0,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                            text: 'Similar',
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
                            text: "df",
                            //text: art.description,
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
                ],
              )),
            ),
          ],
        )
      ]),
    );
  }
}
