import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqlflite_demo/screens/reusable.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
          children: [
           TextForms(title: "Name",),
           TextForms(title: "address",),
           Padding(
             padding: const EdgeInsets.only(left: 60,right: 60),
             child: ElevatedButton(onPressed: (){}, child: Text("Add")),
           )
          ],
      )),
    );
  }
}