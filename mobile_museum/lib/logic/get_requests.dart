import 'package:flutter/material.dart';
import 'package:mobile_museum/model/art.dart';
import 'package:mobile_museum/logic/api/http_service.dart';

class GetPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Tester"),
      ),
      body: FutureBuilder(
          future: HttpService.getObj(436622),
          builder: (BuildContext context, AsyncSnapshot<Art> snapshot) {
            if (snapshot.hasData) {
              Art art = snapshot.data!;
              return Center(
                  child: Text(
                art.title,
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
