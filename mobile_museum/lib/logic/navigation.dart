// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_museum/presentation/filters.dart';
import 'package:mobile_museum/presentation/home_page.dart';
import 'package:mobile_museum/presentation/search_requests.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[
    MyHomePage(
      title: 'Feed',
    ),
    SearchPage(),
    FindPage(title: 'Favorite'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Color(0xFFBC8F8F),
              icon: Icon(
                Icons.account_balance,
              ),
              label: 'Museum'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border,
              ),
              label: 'Favorite'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        fixedColor: Color(0xFF780116),
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
