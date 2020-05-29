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
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "EditTask",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Contants.backgroudColor,
        elevation: 0,
      ),
      backgroundColor: Contants.backgroudColor,
      body: Center(
        child: Container(
          child: Text("Edit Task Page"),
        ),
      ),
    );
  }
}
