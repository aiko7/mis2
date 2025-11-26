// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mealdb_app/main.dart';
import 'package:mealdb_app/view/home_screen.dart';

class _BlockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? _) {
    return _BlockingHttpClient();
  }
}

class _BlockingHttpClient implements HttpClient {
  @override
  noSuchMethod(Invocation invocation) => throw UnsupportedError('HTTP disabled in tests');
}

void main() {
  HttpOverrides.global = _BlockHttpOverrides();

  testWidgets('App loads HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MealDbApp());
    await tester.pumpAndSettle();

    // Verify HomeScreen is present.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
