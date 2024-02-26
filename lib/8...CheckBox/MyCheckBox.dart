import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    bool _selected=false;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Check Box"),
        ),
        body: ListView(
          children: [
            Text("Please select your Gender??",style: TextStyle(fontSize: 20),),
            ListTile(
            leading: Checkbox(value: _selected, onChanged: (v){

              setState(() {
                _selected=v!;

              });
              }),
              title:Text("Male"),
            ),
            ListTile(
              leading: Checkbox(
                  value: _selected, onChanged: (value){
                setState(() {
                  _selected=value!;
                });
              }),
              title:Text("Female"),
            ),


          ],
        ),
      ),
    );
  }
}
