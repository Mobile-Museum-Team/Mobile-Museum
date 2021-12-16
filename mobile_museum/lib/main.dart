import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_museum/logic/cubit/search_cubit.dart';
import 'package:mobile_museum/presentation/search_requests.dart';
import 'logic/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
            scaffoldBackgroundColor: Color(0xFFFFFAFA)),
        title: 'Bottom Navigation Bar Tutorial',
        //home: Navigation(),
        home: BlocProvider(
          create: (_) => SearchCubit(),
          child: Navigation(),
        ));
  }
}
