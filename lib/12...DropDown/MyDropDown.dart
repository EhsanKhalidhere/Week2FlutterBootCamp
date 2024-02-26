import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Drop Down"),
        ),
        body:Center(
          child: DropdownMenu(dropdownMenuEntries: [],

          ),
        ) ,
      ),
    );
  }
}
