import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_museum/main.dart';
import 'package:mobile_museum/model/art.dart';
import 'package:mobile_museum/presentation/theme_colors.dart';
import 'package:mobile_museum/logic/api/http_service.dart';
import 'package:mobile_museum/presentation/art_item.dart';
import 'package:mobile_museum/dummy_data.dart';
import 'package:mobile_museum/presentation/home_page.dart';

const String ART_BOX = "art";

class Favorites extends StatelessWidget {
  late final Art art;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ValueListenableBuilder(
        valueListenable: artBox.listenable(),
        builder: (context, box, child) {
          final arts = artBox.values.toList();

          return GridView(
            children: arts.map((artItem) => ArtItem(artItem)).toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
          );
        },
      ),
    );
  }
}
