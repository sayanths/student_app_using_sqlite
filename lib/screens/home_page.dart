import 'package:flutter/material.dart';
import 'package:sqlflite_demo/model/db_model.dart';
import 'package:sqlflite_demo/screens/adding_page.dart';
import 'package:sqlflite_demo/screens/edit_user/edit_user.dart';
import 'package:sqlflite_demo/screens/view_user/view_user.dart';
import 'package:sqlflite_demo/service/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DbModel> _userList;
  final _userService = UserService();

  getAllDetails() async {
    var users = await _userService.readAllUser();
    _userList = <DbModel>[];
    users.forEach((user) {
      setState(() {
        var userModel = DbModel();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.contact = user['contact'];
        userModel.description = user['description'];
        _userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllDetails();
    
    super.initState();
  }

  _showSucesssnackBar(String message) {
    ScaffoldMessenger.of(context);
    SnackBar(content: Text(message));
  }

  _deleteFormDialgue(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: Text("Do you want to delete?"),
            actions: [
              TextButton(
                  onPressed: () async {
                    var result = await _userService.deleteUser(userId);
                    
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sqlite Demo"),
      ),
      body: ListView.builder(
          itemCount: _userList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewUser(
                            user: _userList[index],
                          )));
                },
                title: Text(_userList[index].name ?? ''),
                leading: const Icon(Icons.person),
                subtitle: Text(_userList[index].contact ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditUser(
                                    user: _userList[index],
                                  )));
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 14, 139, 18),
                        )),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialgue(context, _userList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddingPage()))
              .then((data) {
            if (data != null) {
              getAllDetails();
              _showSucesssnackBar("user details added sucessfully");
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
