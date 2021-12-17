import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/logic/api/http_service.dart';
import 'package:mobile_museum/logic/cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        backgroundColor: Color(0xFFBC8F8F),
        title: const Text("Search Tester"),
      ),
      //body: BlocBuilder<SearchCubit, SearchState>(
      //builder: (context, state) {
      //if (state.progressBarActive) {
      //return CircularProgressIndicator();
      // } else {
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.progressBarActive) {
            return Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
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
                          child: Container(child: Icon(Icons.search)))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    //padding: EdgeInsets.symmetric(horizontal: 16),
                    child: GridView(
                      children:
                          resList.map((artItem) => ArtItem(artItem)).toList(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 2 / 2,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
