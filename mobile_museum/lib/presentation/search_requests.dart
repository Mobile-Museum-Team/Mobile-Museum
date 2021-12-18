import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/logic/api/http_service.dart';
import 'package:mobile_museum/logic/cubit/search_cubit.dart';
import 'package:mobile_museum/presentation/theme_colors.dart';
import 'package:shimmer/shimmer.dart';

import 'art_item.dart';

class SearchPage extends StatefulWidget {
  String query = "";
  SearchPage();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final HttpService httpService = HttpService();
  List<Art> resList = [];
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    if (widget.query != "") {
      Future resList = httpService.searchObj(widget.query);
    }
    searchController.text = widget.query;
    super.initState();
  }

  bool _progressBarActive = true;

  @override
  Widget build(BuildContext context) {
    //return BlocBuilder<SearchCubit, SearchState>(
    //builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          backgroundColor: MyColors.mainTextColor,
          title: const Text("Search Tester"),
        ),
        //body: BlocBuilder<SearchCubit, SearchState>(
        //builder: (context, state) {
        //if (state.progressBarActive) {
        //return CircularProgressIndicator();
        // } else {

        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      //focusNode: focusNode,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "search paintings",
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        BlocProvider.of<SearchCubit>(context).startLoad();
                        try {
                          var resLst = await httpService
                              .searchObj(searchController.text);
                          if (resLst != null) {
                            resList = resLst;
                            setState(() {
                              //resList = resLst;
                            });
                          }
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
                                    // TextButton(
                                    //   onPressed: () {
                                    //     Navigator.pop(context);
                                    //   },
                                    //   child: Text('Reload'),
                                    // )
                                  ],
                                );
                              });
                        }
                        BlocProvider.of<SearchCubit>(context).stopLoad();
                      },
                      child: Container(
                          child: Icon(Icons.search,
                              color: MyColors.mainTextColor)))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                //padding: EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.progressBarActive) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: GridView(
                          children: List.generate(
                            10,
                            //(index) => Shimmer.fromColors(
                            //baseColor: Colors.white,
                            // highlightColor: Colors.grey,
                            //child: Padding(
                            (index) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 180,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            //),
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 2 / 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0),
                        ),
                      );
                    }
                    return GridView(
                      children:
                          resList.map((artItem) => ArtItem(artItem)).toList(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 2 / 2,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
