import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("SnackBar Message"),),
      body: Center(
          child: ElevatedButton(
            child: Text("Click Me"),
            onPressed: () async {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("i am a snack bar")));
             await  Future.delayed(Duration(seconds: 1));
             ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          )
      ),

    );
  }
}
