import 'package:flutter/material.dart';
import 'view/home_screen.dart';

void main() => runApp(MealDbApp());

class MealDbApp extends StatelessWidget {
  const MealDbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealDB Recipes',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreen(),
    );
  }
}
