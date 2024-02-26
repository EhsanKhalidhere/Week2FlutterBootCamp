import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRadioButtons extends StatefulWidget {
  const MyRadioButtons({super.key});

  @override
  State<MyRadioButtons> createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  int _selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My radio Buttons'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Radio(
                activeColor: Colors.red,
                value: 0, groupValue: _selected, onChanged:(value){
              setState(() {
                _selected=value!;
              });


            } ),
            title: Text("Android App Development"),
          ),
          ListTile(
            leading: Radio(
                activeColor: Colors.red,
                value: 1, groupValue: _selected, onChanged:(value){
              setState(() {
                _selected=value!;
              });


            } ),
            title: Text("Ios App Development"),
          )
        ],
      ),
    );
  }
}
