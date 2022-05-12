import 'package:flutter/material.dart';
import 'package:search_weather/screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Loading(),
    );
  }
}
