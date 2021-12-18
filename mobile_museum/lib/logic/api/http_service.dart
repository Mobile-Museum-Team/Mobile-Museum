import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_museum/model/art.dart';
import 'package:html/parser.dart';

class HttpService {
  static const int pageSize = 10;
  int page = 0;
  int nPages = 0;
  bool isLoading = false;
  String lastquery = "";
  List<Art> resList = [];

  static Future<Art> getObj(int id) async {
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
      throw 228;
    }
  }

  Future<List<Art>?> searchObj(String query, {int page = 0}) async {
    if (query != "") {
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
        //idList = SepArr(idList, pageSize)[page];
        List<Art> artList = [];
        artList = await Future.wait(idList.map((el) => getObj(el)));

        // for (var id in idList) {
        //   Art artIt = getObj(id.toInt());
        //   print("\t\tAdding ID ${id.toInt()} to ArtList as Art obj");

        //   artList.add(artIt);
        // }
        return artList;
      } else {
        throw 228;
      }
    } else {
      return null;
    }
  }

  Future<void> NewSearchPage() async {
    if ((page < nPages) && (isLoading == false)) {
      isLoading = true;
      print("loading new page");
      page += 1;
      var resLst = await searchObj(lastquery, page: page);
      resList += resLst ?? [];
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
    var url = Uri.https("www.metmuseum.org",
        "/art/collection/search/322890"); //+ artItem.id.toString());
    final responce = await Client().get(url, headers: {
      "Cookie":
          "incap_ses_584_1661922=id/+V3BBnUf5gWAErskaCNEnumEAAAAArnI4H5wO+YENWf3vX/ssJw==; incap_ses_379_1661922=6w07FaMlpm1OzmBKHHtCBVbMuGEAAAAAIKR5nDfZoE7Uzmkqada6AQ==; incap_ses_584_1662004=zHoaKbCEGk1eHDkCrskaCDLLuGEAAAAAy1bEI3OIEX/1aVtEmxSwaQ==; incap_ses_379_1662004=qT6ZIRNWejWi+VtKHHtCBTHLuGEAAAAAXcd8HOp3NEDYk6uIFggSxg==; incap_ses_379_1661977=jO9bKKvNxWZ8NzVKHHtCBaC7uGEAAAAATBRypx8YQ7JgvnG0aMV+0Q==; incap_ses_376_1661977=YDvJWlJHs0KY8yUArNI3BXSquGEAAAAA9/KjtztiQ2RI3gS4F8R22w==; incap_ses_376_1661922=ha2VD8gE7B4FxSUArNI3BVqquGEAAAAA7BzobjQaZuKB7v4IYV1bCw==; incap_ses_582_1661977=gev7SXE0XSbUBzYA+60TCNhrtGEAAAAAs9iVvRABt5f2yVHAFtP5HA==; incap_ses_580_1661977=Sg34a9TcQn/s2dWf5pMMCB1Cs2EAAAAA6iSfyDWUJmn4Rw/uno9oyA==; __RequestVerificationToken=fHuc0XemjlVWvTQDoehIaADoN9_ebWphG4rlyeytsH8NxvyTpORN-caroP-MCX4vbLQmi_TU8grRLB-iIfPMvGS9OrI1; shell#lang=en; incap_ses_799_1661977=+3D2HEbZ9mUaySca7J4WC8w+s2EAAAAAXdLqwc6DjYF7mQ6C/SKjBA==; incap_ses_799_1661922=YFcYbhtssVbAxyca7J4WC8o+s2EAAAAA/8JzbVgLNgoJWR9hnDxDfQ==; incap_ses_1317_1661977=JF4ZQQQjgjKJqhif9exGEj84smEAAAAAszL5uHrsTqWzG2tDZKRtsw==; incap_ses_1317_1661922=ukjCCtGG2iW9aBif9exGEhc4smEAAAAA/1zr2W9npSPA5iYFOCSq3A==; incap_ses_1317_1662004=qluoH1weuCTrlBWf9exGEmM2smEAAAAAkfOwHjDwgHkx1gr12X5SMg==; incap_ses_586_1662004=ZvR/ZXuB9D/TWMbvmuQhCCc2smEAAAAAkF4CAcVD3bCJXORu3BELPg==; visid_incap_1662004=M7c8EoT1THCOB46TGs/e3mkhsWEAAAAAQUIPAAAAAAAS/w84ruknu+PpdLaadrWw; incap_ses_586_1661977=v81lSGxBu0J5HsfvmuQhCCY2smEAAAAA43X+aMI5j5ZQzItr9w1k8Q==; incap_ses_586_1661922=q7R8As/Avw1/HcfvmuQhCCU2smEAAAAAhyvkde8FPGwVlHciJ54APA==; ki_s=221516%3A1.0.0.1.1; incap_ses_800_1661922=Md/gK2xbzkHgkx0UZiwaC+fusWEAAAAAv4ZczhyYAFeChyRySNCu5w==; ki_u=69282a93-83e4-73ab-bb19-2b19; incap_ses_580_1662004=ghfPZJP5z13aB4Oe5pMMCN/usWEAAAAARWalC83VOAabLtyla+fP7Q==; incap_ses_800_1662004=f3Nydbxlvmx/hx0UZiwaC+DusWEAAAAAk25u8pXIvSbBjQ1yX5Vs6Q==; incap_ses_580_1661922=LAvOCW0ltgqWBYOe5pMMCN3usWEAAAAAiuV99ewCA+gGQr8hFZK0MQ==; ObjectPageSet=0.895734470289077; visid_incap_1661977=1oC9SBY5SweoLiO1TVsFZfG9sGEAAAAAQUIPAAAAAADHBawpxUJefKr9xN1kKzA/; visid_incap_1661922=8c5JX2xBT2i91tmksgDfZeS8sGEAAAAAQUIPAAAAAABcKRoxJVJpSQxSd1rQ41j3"
    });
    if (responce.statusCode == 200) {
      var doc = parse(responce.body);
      print(doc.body);
      var link = doc.getElementsByClassName("nas nas--base").length;
      var text = link.toString();
      artItem.description = text;
    }
  }
}
