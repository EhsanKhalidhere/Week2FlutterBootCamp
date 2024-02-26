import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Page1"),),
        body: Center(
          child: ElevatedButton(
            child: Text("Go To NEXT Page"),
            onPressed: (){
              Navigator.pushNamed(context, "page2");
            },
          )
        ),
      ),


    );
  }
}
