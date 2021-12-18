// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_museum/presentation/favorites.dart';
import 'package:mobile_museum/presentation/hive.dart';
import 'package:mobile_museum/presentation/home_page.dart';
import 'package:mobile_museum/presentation/search_requests.dart';
import 'package:mobile_museum/presentation/theme_colors.dart';
import 'package:shimmer/shimmer.dart';

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
    Favorites(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
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
        fixedColor: MyColors.mainTextColor,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
