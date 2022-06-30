import 'package:flutter/material.dart';

class TextForms extends StatefulWidget {
  String title;

  TextForms({
    super.key,
    required this.title,
  });

  @override
  State<TextForms> createState() => _TextFormsState();
}
  TextEditingController nameController = TextEditingController();

class _TextFormsState extends State<TextForms> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(widget.title),
                )),
            Expanded(
              child: TextField(
                controller: nameController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
