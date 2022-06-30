import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlflite_demo/db_functions/db_functions.dart';
import 'package:sqlflite_demo/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
