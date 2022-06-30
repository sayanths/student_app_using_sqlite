import 'package:flutter/material.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final _nameController = TextEditingController();
  final _ContactController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Text("Add user"),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                errorText: _validateName ? 'value cant be empty' : null,
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _ContactController,
              decoration: InputDecoration(
                errorText: _validateContact ? 'value cant be empty' : null,
                label: Text('contact'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                errorText: _validateDescription ? 'value cant be empty' : null,
                label: Text('description'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nameController.text.isEmpty
                        ? _validateName = true
                        : _validateName = false;
                    _ContactController.text.isEmpty
                        ? _validateContact = true
                        : _validateContact = false;
                    _descriptionController.text.isEmpty
                        ? _validateDescription = true
                        : _validateDescription = false;
                    if (_validateName == false && _validateContact == false ||
                        _validateDescription) {
                      // print("data can save");

                    }
                  });
                },
                child: Text("Add")),
          )
        ],
      )),
    );
  }
}
