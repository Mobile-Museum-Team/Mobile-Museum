import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_museum/logic/api/http_service.dart';
import 'package:mobile_museum/logic/cubit/search_cubit.dart';
import 'package:mobile_museum/presentation/art_item.dart';
import 'package:mobile_museum/dummy_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_museum/presentation/theme_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../art.dart';

import 'dart:io';

final styleTags = [
  'Women',
  'Men',
  'Trees',
  'Portraits',
  'Saint',
  'Landscapes',
  'Buildings',
  'Horses',
  'Angels',
  'House',
  'Christ'
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Art> resList = DUMMY_DATA;
  void _incrementCounter() {
    setState(() {});
  }

  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xFFF2F4F3),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shadowColor: Colors.black,
            //foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            backgroundColor: MyColors.mainTextColor,
            floating: false,
            expandedHeight: 20.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Mobile Museum',
                style: TextStyle(color: Color(0xFFF2F4F3)),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 55, 0, 25),
                            child: Container(
                              child: Text.rich(
                                TextSpan(
                                  text: 'Welcome \nto The Met\nMuseum of Art',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.mainTextColor,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 00, 0),
                            child: Container(
                              height: 180,
                              child: SvgPicture.network(
                                  'https://logotyp.us/files/the-met.svg'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 25, 30),
                      child: Container(
                        child: Text.rich(
                          TextSpan(
                            text: 'Bring some culture to your phone',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.popTextColor,
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
                          itemCount: styleTags.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return InkWell(
                                onTap: () {
                                  BlocProvider.of<SearchCubit>(context)
                                      .startLoadFilters();
                                  resList = DUMMY_DATA;
                                  BlocProvider.of<SearchCubit>(context)
                                      .stopLoadFilters();
                                  print("Container clicked");
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFec012a),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () async {
                                  BlocProvider.of<SearchCubit>(context)
                                      .startLoadFilters();
                                  try {
                                    var rresList = await httpService
                                        .searchObj(styleTags[index - 1]);
                                    resList = rresList!;
                                    sleep(Duration(seconds: 1));
                                  } on Exception catch (e) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoAlertDialog(
                                            title: Text('No connection'),
                                            content: Text(
                                                'We were unable to load pieces from server. Check your internet conection and try again later.'),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Close')),
                                            ],
                                          );
                                        });
                                  }
                                  BlocProvider.of<SearchCubit>(context)
                                      .stopLoadFilters();
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFec012a),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(styleTags[index - 1],
                                          style: const TextStyle(
                                            color: Color(0xFFFFFAFA),
                                            fontSize: 17,
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (!state.progressActiveFilters) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  delegate: SliverChildBuilderDelegate(
                    (context, int index1) {
                      var el = ArtItem(resList[index1]);
                      return el;
                    },
                    childCount: resList.length,
                  ),
                );
              }
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index1) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        //color: Colors.white, height: 180, width: 170),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              //color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 16,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
