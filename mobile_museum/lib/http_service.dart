import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_museum/art.dart';

class HttpService {
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

  Future<List<Art>> searchObj(String query) async {
    final url = Uri.https(
      'collectionapi.metmuseum.org',
      'public/collection/v1/search',
      {'q': query.toString(), 'departmentId': 11.toString()},
    );
    Response res = await get(url);
    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> idList = body["objectIDs"].toList();
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
}
