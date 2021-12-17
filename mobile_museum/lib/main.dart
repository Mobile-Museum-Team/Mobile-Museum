import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:mobile_museum/art_view_page.dart';
import 'package:mobile_museum/get_requests.dart';
import 'package:mobile_museum/search_requests.dart';

import 'art.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
            scaffoldBackgroundColor: Color(0xFFFFFAFA),
            backgroundColor: Color(0xFF5F2F7F)),
        //backgroundColor: Color(0xFF5F2F7F),
        title: 'Bottom Navigation Bar Tutorial',
        //home: Navigation(),
        home: BlocProvider(
          create: (_) => SearchCubit(),
          child: Navigation(),
        ));
  }
}
