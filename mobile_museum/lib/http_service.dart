import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_museum/art.dart';
import 'package:html/parser.dart';

class HttpService {
  static const int pageSize = 10;
  int page = 0;
  int nPages = 0;
  bool isLoading = false;
  String lastquery = "";
  List<Art> resList = [];

  Future<Art> getObj(int id) async {
    final Uri url = Uri.https(
      'collectionapi.metmuseum.org',
      'public/collection/v1/objects/' + id.toString(),
    );
    Response res = await get(url);
    if (res.statusCode == 200) {
      //print("Responce got");
      Map<String, dynamic> body = jsonDecode(res.body);
      //print("body decoded");
      Art recievedArt = Art.fromJson(body);
      //print("recieved");
      return recievedArt;
    } else {
      throw "Err. Get by id - no response";
    }
  }

  Future<List<Art>> searchObj(String query, {int page = 0}) async {
    final url = Uri.https(
      'collectionapi.metmuseum.org',
      'public/collection/v1/search',
      {'q': query.toString(), 'departmentId': "11"},
    );
    lastquery = query;
    Response res = await get(url);
    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> idList = body["objectIDs"].toList();
      idList = SepArr(idList, pageSize)[page];
      List<Art> artList = [];
      for (var id in idList) {
        Art artIt = await getObj(id.toInt());
        print("\t\tAdding ID ${id.toInt()} to ArtList as Art obj");

        artList.add(artIt);
      }
      return artList;
    } else {
      throw "Err. Search from query - no response";
    }
  }

  Future<void> NewSearchPage() async {
    if ((page < nPages) && (isLoading == false)) {
      isLoading = true;
      print("loading new page");
      page += 1;
      var resLst = await searchObj(lastquery, page: page);
      resList += resLst;
      isLoading = false;
    }
  }

  List<List<dynamic>> SepArr(List<dynamic> list, int size) {
    nPages = (list.length + size - 1) ~/ size - 1;
    int gi = 0;
    List<List<dynamic>> newList = [];
    for (int i = 0; i < nPages; ++i) {
      List<dynamic> arr = [];
      for (int j = 0; (j < size) && (gi < list.length); ++j) {
        arr.add(list[gi]);
        ++gi;
      }
      newList.add(arr);
    }

    return newList;
  }

  Future<void> htmlParser(Art artItem) async {
    final responce = await Client().get(Uri.parse(
        'https://www.metmuseum.org/art/collection/search/' +
            artItem.id.toString()));
    if (responce.statusCode == 200) {
      var doc = parse(responce.body);
      print(responce.body);
      var link = doc.getElementsByClassName("nas nas--base").length;
      var text = link.toString();
      artItem.description = text;
    }
  }
}
