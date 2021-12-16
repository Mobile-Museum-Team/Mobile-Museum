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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.amber,
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
