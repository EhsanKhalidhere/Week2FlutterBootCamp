import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPopUpMenu extends StatefulWidget {
  const MyPopUpMenu({super.key});

  @override
  State<MyPopUpMenu> createState() => _MyPopUpMenuState();
}

class _MyPopUpMenuState extends State<MyPopUpMenu> {
  int _selected=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("My Pop Up Buttons"),
          actions: [
            PopupMenuButton(
              initialValue: _selected,
                onSelected: (menu){
                  setState(() {
                    _selected=menu;
                  });
                },
                itemBuilder: (context){

              return [
                PopupMenuItem(
                    value: 0,
                    child: Text("Item1")),
                PopupMenuItem(
                    value: 1,
                    child: Text("Item2")),
                PopupMenuItem(
                    value:2,
                    child: Text("Item3"))
              ];
            })
          ],
        ) ,
      ),


    );
  }
}
