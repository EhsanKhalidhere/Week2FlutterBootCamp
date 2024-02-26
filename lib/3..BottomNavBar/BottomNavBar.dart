import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });

          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.blue,
          selectedIconTheme: IconThemeData(color: Colors.red),
          unselectedIconTheme: IconThemeData(color:Colors.black),
          selectedItemColor: Colors.red,
          selectedFontSize: 25,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.design_services),label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),



        ],

        ),
        body: _SwitchOnIndex(),


      ),
    );
  }
  _SwitchOnIndex(){
    switch(_currentIndex){
      case 0:{
        return Center(child: Text("HomePage",style: TextStyle(fontSize: 20),),);
      }
    case 1:{
    return Center(child: Text("SettingPage",style: TextStyle(fontSize: 20),),);
    }
    case 2:{
    return Center(child: Text("Profile Page",style: TextStyle(fontSize: 20),),);
    }
    }

    }
  }

