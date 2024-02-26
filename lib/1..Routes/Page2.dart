import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week2/1..Routes/Routes.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Page 2 "),),
        body: Center(
          child: ElevatedButton(
            child: Text("Go To First Page"),
            onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (c)=>RoutesPage()));
            },
          )
        ),
      ),


    );
  }
}
