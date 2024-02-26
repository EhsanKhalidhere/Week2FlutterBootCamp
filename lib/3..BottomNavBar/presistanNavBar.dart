import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistantNavBar extends StatefulWidget {
  const PersistantNavBar({super.key});

  @override
  State<PersistantNavBar> createState() => _PersistantNavBarState();
}

class _PersistantNavBarState extends State<PersistantNavBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: PersistentTabView(
          context,

          screens: [
            Home(),Setting(),Profile()


        ],
          backgroundColor: Colors.lightBlue,
          navBarStyle: NavBarStyle.style3,
          items: [
            PersistentBottomNavBarItem(icon: Icon(Icons.home),title: "Home",activeColorPrimary: Colors.red,inactiveColorPrimary: Colors.blue),
            PersistentBottomNavBarItem(icon: Icon(Icons.design_services),title: "Services",activeColorPrimary: Colors.red,inactiveColorPrimary: Colors.blue),
            PersistentBottomNavBarItem(icon: Icon(Icons.person),title: "Profile",activeColorPrimary: Colors.red,inactiveColorPrimary: Colors.blue),

          ],
        )

      ),
    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        leading: Icon(Icons.home),
      ),
      body: Center(
        child: Text("Home Page",style: TextStyle(
          fontSize: 30
        ),),
      ),
    );
  }
}
class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Setting Page"),
        leading: Icon(Icons.settings),
      ),
      body: Center(
        child: Text("Setting Page",style: TextStyle(
            fontSize: 30
        ),),
      ),
    );
  }
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile Page"),
          leading: Icon(Icons.person),
        ),
        body: Center(
          child: Text("Profile Page",style: TextStyle(
              fontSize: 30
          ),),
        ),
      ),
    );
  }
}



