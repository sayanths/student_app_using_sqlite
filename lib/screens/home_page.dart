import 'package:flutter/material.dart';
import 'package:sqlflite_demo/model/db_model.dart';
import 'package:sqlflite_demo/screens/adding_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sqlite Demo"),
      ),
      body: ListView.builder(
          itemCount: _userList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title:Text(_userList[index].name??'') ,
                leading: Icon(Icons.person),
                subtitle: Text(_userList[index].contact??''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      
                    }, icon: Icon(Icons.edit,color: Color.fromARGB(255, 14, 139, 18),)),
                     IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),

                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddingPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
