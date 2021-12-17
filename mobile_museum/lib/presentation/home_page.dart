import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_museum/presentation/art_item.dart';
import 'package:mobile_museum/dummy_data.dart';

final styleTags = [
  'Modernism',
  'Impressionism',
  'Expressionism',
  'Abstract Art',
  'Cubism',
  'Surrealism'
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF2F4F3),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            )),
            backgroundColor: Color(0xFFBC8F8F),
            floating: false,
            expandedHeight: 20.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('MobileMuseum'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 35, 10, 19),
                      child: Container(
                        child: const Text.rich(
                          TextSpan(
                            text: 'Welcome \nto The Met',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF780116),
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(65, 10, 25, 10),
                      child: Container(
                        child: const Text.rich(
                          TextSpan(
                            text: 'Bring some culture to your phone',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 67.0,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: styleTags.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFDBDA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(styleTags[index],
                                      style: const TextStyle(
                                        color: Color(0xFF780116),
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                /*Expanded(
                  child: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        DUMMY_DATA.map((artItem) => ArtItem(artItem)).toList();
                      },
                    ),
                  ),
                )*/
                /*Expanded(
                child: GridView(
                  children:
                      DUMMY_DATA.map((artItem) => ArtItem(artItem)).toList(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                ),
              )*/
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ArtItem(DUMMY_DATA[index]);
                DUMMY_DATA.map((artItem) => ArtItem(artItem)).toList();
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
