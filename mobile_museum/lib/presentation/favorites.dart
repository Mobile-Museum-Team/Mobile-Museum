import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:mobile_museum/logic/get_requests.dart';
import 'package:mobile_museum/presentation/search_requests.dart';

import '../art.dart';

final styleTags = [
  'Modernism',
  'Impressionism',
  'Expressionism',
  'Abstract Art',
  'Cubism',
  'Surrealism'
];

const depprpl = Color(0xFF6200EA);

class FindPage extends StatefulWidget {
  const FindPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        backgroundColor: Color(0xFFBC8F8F),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
              height: 67.0,
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: styleTags.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Color(0x0ff6ffff),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(styleTags[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            )),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
