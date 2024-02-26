import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week2/1..Routes/Page1.dart';

import 'Page2.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({super.key});

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        "page1":(context)=>Page1(),
        "page2":(context)=>Page2(),


      },
    home:HomePage()


    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Routes"),),
      body: Center(
          child: ElevatedButton(
            child: Text("Go To NEXT Page"),
            onPressed: (){
              Navigator.pushNamed(context,"page1");
            },
          )
      ),

    );
  }
}

