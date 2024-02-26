import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDailog extends StatefulWidget {
  const MyAlertDailog({super.key});

  @override
  State<MyAlertDailog> createState() => _MyAlertDailogState();
}

class _MyAlertDailogState extends State<MyAlertDailog> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My Alert Box"),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 200),
            width: double.infinity,

            child: ElevatedButton(
              onPressed: (){
                showDialog(context: context, builder: (c){
                  return AlertDialog(
                    backgroundColor: Colors.red,
                    title:Text("Alert!"),
                    content: Text("Something Went Wrong...."),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Cancel")),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Ok")),
                    ],

                  );

                });

              },
              child: Text("Click Me"),
            ),



            ),
          )

    );
  }
}
