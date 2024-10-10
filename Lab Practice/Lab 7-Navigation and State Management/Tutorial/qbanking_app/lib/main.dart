import 'package:flutter/material.dart';
import 'package:qbanking_app/screens/account_screen.dart';
import 'package:qbanking_app/screens/deposit_screen.dart';
import 'package:qbanking_app/screens/home_screen.dart';
import 'package:qbanking_app/screens/shell_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ShellScreen(child: HomeScreen()),
    );
  }
}
