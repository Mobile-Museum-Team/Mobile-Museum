import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/logic/api/http_service.dart';
import 'package:mobile_museum/logic/cubit/search_cubit.dart';
import 'package:mobile_museum/logic/navigation.dart';
import 'package:mobile_museum/presentation/art_item.dart';
import 'package:mobile_museum/presentation/art_view_page.dart';
import 'package:mobile_museum/presentation/home_page.dart';
import 'package:mobile_museum/presentation/search_requests.dart';

void main() {
  testWidgets(
    'test WIdget',
    (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
          create: (_) => SearchCubit(),
          child: MaterialApp(home: SearchPage())));
      expect(find.byType(SearchPage), findsOneWidget);
    },
  );
}
