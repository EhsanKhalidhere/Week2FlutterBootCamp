 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
   const Mydrawer({super.key});

   @override
   State<Mydrawer> createState() => _MydrawerState();
 }

 class _MydrawerState extends State<Mydrawer> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(

       home: Scaffold(
         appBar: AppBar(
           title: Text("My Drawer"),
         ),
         drawer: Drawer(
           backgroundColor: Colors.blue,
           width: 250,
           child: Container(
             padding: EdgeInsets.all(10),
             child: ListView(
               children: [
                 Row(children: [
                   Container(height: 60,width: 60,decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(40),
                     color: Colors.white
                   ),
                   child: Icon(Icons.person,size: 60,),),
                   SizedBox(width: 10,),
                   Text("Ehsan Khalid",style: TextStyle( color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)

                 ],),
                 SizedBox(height: 10,),
                 Divider(color: Colors.white,thickness: 2,),
                 _ListItem(icon: Icons.privacy_tip, title: "Privacy Policy", onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                 }),
                 _ListItem(icon: Icons.favorite_border, title: "Favourite", onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));
                 }),
                 _ListItem(icon: Icons.notification_important, title: "Notifications", onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                 }),
                 SizedBox(height: 10,),
                 Divider(color: Colors.white,thickness: 2,),
                 _ListItem(icon: Icons.help, title: "Help", onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                 }),
                 _ListItem(icon: Icons.report, title: "Report", onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                 }),

                 
               ],
             ),

           ),

         ),

       ),

     );

   }
   _ListItem({required IconData icon,required String title,required VoidCallback onTap}){
     return
         ListTile(
           leading: Icon(icon,color: Colors.white,size: 30,),
           title: Text(title,style: TextStyle(fontSize: 16,color:Colors.white70),),
           onTap: onTap,
         );

   }}
 class PrivacyPolicy extends StatelessWidget {
   const PrivacyPolicy({super.key});

   @override
   Widget build(BuildContext context) {
     return  SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: Text("PrivacyPage"),

         ),
         body: Center(
           child: Text("Privacy Page",style: TextStyle(
               fontSize: 30
           ),),
         ),
       ),
     );
   }
 }
 class Favourite extends StatelessWidget {
   const Favourite({super.key});

   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Favourite Page"),
         ),
         body: Center(
           child: Text("Favourite Page",style: TextStyle(
               fontSize: 30
           ),),
         ),
       ),
     );
   }
 }
 class Notifications extends StatelessWidget {
   const Notifications({super.key});

   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Notification Page"),
         ),
         body: Center(
           child: Text("Notification Page",style: TextStyle(
               fontSize: 30
           ),),
         ),
       ),
     );
   }
 }



