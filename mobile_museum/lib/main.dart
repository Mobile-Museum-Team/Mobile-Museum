import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_museum/logic/cubit/search_cubit.dart';
import 'package:mobile_museum/logic/navigation.dart';
import 'package:mobile_museum/presentation/theme_provider.dart';

import 'art.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        //theme: ThemeData(
        //colorScheme: ColorScheme.fromSwatch(primarySwatch: Color(0xFFF2F4F3)),
        //    scaffoldBackgroundColor: Color(0xFFF2F4F3),
        //    backgroundColor: Color(0xFFF2F4F3)),
        //backgroundColor: Color(0xFF5F2F7F),
        //title: 'Bottom Navigation Bar Tutorial',
        //home: Navigation(),
        home: BlocProvider(
          create: (_) => SearchCubit(),
          child: Navigation(),
        ));
  }
}
