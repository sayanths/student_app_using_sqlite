import 'package:flutter/material.dart';
import 'package:sqlflite_demo/model/db_model.dart';
import 'package:sqlflite_demo/service/user_service.dart';

class EditUser extends StatefulWidget {
  final DbModel user;

  const EditUser({super.key, required this.user});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _nameController = TextEditingController();
  final _ContactController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  var _userServices = UserService();

  @override
  void initState() {
    setState(() {
      _nameController.text = widget.user.name ?? '';
      _ContactController.text = widget.user.contact ?? '';
      _descriptionController.text = widget.user.description ?? '';
    });
  }

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
                onPressed: () async {
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
                  });
                  if (_validateName == false && _validateContact == false ||
                      _validateDescription == false) {
                    // print("data can save");
                    var _user = DbModel();
                    _user.id = widget.user.id;
                    _user.name = _nameController.text;
                    _user.contact = _ContactController.text;
                    _user.description = _descriptionController.text;

                    var result = await _userServices.updateUser(_user);
                    Navigator.pop(context, result);
                  }
                },
                child: Text("Update")),
          )
        ],
      )),
    );
  }
}
