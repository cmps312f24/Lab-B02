import 'package:flutter/material.dart';
import 'package:flutter_intro/home_page.dart';

void main() {
  runApp(const MyApp(text: "Welcome to Flutter Development"));
}

class MyApp extends StatelessWidget {
  final String text;
  const MyApp({super.key, required this.text});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
