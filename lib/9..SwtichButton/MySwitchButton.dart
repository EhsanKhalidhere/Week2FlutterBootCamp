import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitchButton extends StatefulWidget {
  const MySwitchButton({super.key});

  @override
  State<MySwitchButton> createState() => _MySwitchButtonState();
}

class _MySwitchButtonState extends State<MySwitchButton> {
  bool _selected=false;
  @override
  Widget build(BuildContext context) {

    return   MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Switch Buttonx"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: _selected==true?Colors.black:Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Light"),
              Switch(value: _selected, onChanged: (v){
                setState(() {
                  _selected=v;

                });
              })
            ],
          ),
        )
        ),
    );
}}
