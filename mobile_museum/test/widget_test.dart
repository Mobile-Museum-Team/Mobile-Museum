import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_museum/logic/cubit/search_cubit.dart';
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
