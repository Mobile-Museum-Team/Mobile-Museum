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
        backgroundColor: Colors.amber,
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
            print("fuck");
            return CircularProgressIndicator();
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
                          decoration: const InputDecoration(
                            hintText: "search paintings",
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () async {
                            BlocProvider.of<SearchCubit>(context).startLoad();
                            var resLst = await httpService
                                .searchObj(searchController.text);
                            resList = resLst;
                            BlocProvider.of<SearchCubit>(context).stopLoad();
                            setState(() {
                              //resList = resLst;
                            });
                            print("performing search");
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

  @override
  Widget buildlhj(BuildContext context) {
    //return BlocBuilder<SearchCubit, SearchState>(
    //builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Tester"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "search paintings",
                    ),
                  ),
                ),
                InkWell(
                    onTap: () async {
                      var resLst =
                          await httpService.searchObj(searchController.text);
                      setState(() {
                        resList = resLst;
                      });
                      print("performing search");
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
              children: resList.map((artItem) => ArtItem(artItem)).toList(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
            )),
          ],
        ),
      ),
    );
  }
}
