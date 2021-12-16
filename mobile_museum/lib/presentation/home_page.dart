import 'package:flutter/material.dart';
import 'package:mobile_museum/presentation/art_item.dart';
import 'package:mobile_museum/dummy_data.dart';

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
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.title), backgroundColor: Color(0xFFBC8F8F)),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(),
              ),
            ],
          ),
          Expanded(
            child: GridView(
              children: DUMMY_DATA.map((artItem) => ArtItem(artItem)).toList(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
            ),
          )
        ],
      ),
    );
  }
}
