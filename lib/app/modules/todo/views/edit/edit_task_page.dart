import 'package:flutter/material.dart';
import '../../../../helpers/constants.dart';

class EditTaskPage extends StatefulWidget {
  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "EditTask",
        ),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Text("Edit Task Page"),
        ),
      ),
    );
  }
}
