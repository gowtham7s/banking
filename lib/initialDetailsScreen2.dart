import 'package:banking/customWidgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'helpers/helpers.dart';
import 'dart:ui';

class InitialDetailScreen2 extends StatefulWidget {
  const InitialDetailScreen2({Key? key}) : super(key: key);

  @override
  State<InitialDetailScreen2> createState() => _InitialDetailScreenState();
}

class _InitialDetailScreenState extends State<InitialDetailScreen2> {

  String emailErrorText = "";
  String employeeStatus = "";
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
  List<String> listItem = ["Employed", "Self Employed", "Government", "Pensioner"];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () => Navigator.of(context).pop(false),
      //   ),
      //   title: Text('Find Devices'),
      //   actions: <Widget>[],
      // ),
        body:
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            if (index == 1) {
                  return Container();
                }

            return Container(
              height: 50,
              color: index % 2 == 0 ? Colors.yellow : Colors.red,
            );
          }
            ),

    );
  }
}