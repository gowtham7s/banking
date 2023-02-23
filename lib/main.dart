import 'package:flutter/material.dart';
import 'getXexamples.dart';
import 'initialDetailScreen.dart';
import 'initialDetailsScreen2.dart';
import 'internalionalization.dart';

void main() {
  runApp(const Internationalization());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitialDetailScreen2(),
    );
  }
}
