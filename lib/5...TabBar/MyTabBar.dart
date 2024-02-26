import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tab Bars'),


            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.cloud,color: Colors.white,),
                text: "Cloud",),
              Tab(icon: Icon(Icons.terrain,color: Colors.white,),
                text: "Terrain",),
              Tab(icon: Icon(Icons.waves,color: Colors.white,),
                text: "Wave",)
            ]),
          ),
          body: TabBarView(
            children: [
             Cloud(),
              Center(child: Text("TAb2",),),
              Center(child: Text("TAb3",),)
            ],
          ),
        )

      ),
    );
}}
class Cloud extends StatefulWidget {
  const Cloud({super.key});

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is a Tab 1"),
      ),
    ) ;}
}
