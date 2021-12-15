import 'package:flutter/material.dart';
import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/art_item.dart';
import 'package:mobile_museum/http_service.dart';

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
    if (widget.query != "")
      Future resList = httpService.searchObj(widget.query);
    searchController.text = widget.query;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      decoration: InputDecoration(
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
                children: resList
                    .map((artItem) => ArtItem(
                        artItem.id, artItem.title, artItem.primaryImage))
                    .toList(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
              )),
            ],
          ),
        ));
  }
}
