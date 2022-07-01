import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqlflite_demo/model/db_model.dart';

class ViewUser extends StatefulWidget {
  final DbModel user;
  const ViewUser({super.key,required this.user});

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Full Details"),
          Row(
            children: [
              Text("Name :"),
              Text(widget.user.name??''),

            ],
          ),
           Row(
            children: [
              Text("contact :"),
              Text(widget.user.contact??''),

            ],
          ),
            Row(
            children: [
              Text("description :"),
              Text(widget.user.description??''),

            ],
          ),
        ],
      ),
    );
  }
}
