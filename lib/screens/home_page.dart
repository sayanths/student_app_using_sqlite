import 'package:flutter/material.dart';
import 'package:sqlflite_demo/screens/adding_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sqlite Demo"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddingPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
