import 'package:flutter/material.dart';
import 'package:todo_app/app/helpers/constants.dart';

class EditTaskPage extends StatefulWidget {
  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EditTask"),
        backgroundColor: Contants.BACKGROUND_COLOR,
        elevation: 0,
      ),
      backgroundColor: Contants.BACKGROUND_COLOR,
      body: Center(
        child: Container(
          child: Text("Edit Task Page"),
        ),
      ),
    );
  }
}
