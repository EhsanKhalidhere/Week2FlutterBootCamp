import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Music App With Card"),
        ),
        body:ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext,context){
          return _Card();
        })
    )
    );
}
  _Card(){
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text("Unknown Artisit"),
            subtitle: Text("Be a Man Be a man"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){}, child: Text("Play")),
              TextButton(onPressed: (){}, child: Text("Stop")),
            ],
          )
        ],
      ),
    );

  }
}
