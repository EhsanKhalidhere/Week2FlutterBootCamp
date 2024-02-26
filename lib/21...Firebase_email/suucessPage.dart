import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week2/21...Firebase_email/Sign_In_Page.dart';

class SuccessPage extends StatelessWidget   {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading:TextButton(onPressed: () async{
        final auth=FirebaseAuth.instance;
        await auth.signOut();

        Navigator.push(context, MaterialPageRoute(builder: (_){
          return SignInPage();
        }));
      }, child: Icon(Icons.login_outlined,color: Colors.white,))
,
      actions: [
         ],
      backgroundColor: Colors.green,
      title: Text("Success Page"),
    ),
      body: Center(
      child: Container(
        child: Icon(Icons.done,color: Colors.white,size: 50,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: Colors.green,
        ),
        height: 200,
        width: 200,

      ),  
      ),
    );
  }
}
