import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:week2/21...Firebase_email/suucessPage.dart';

import 'SignUp_Page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey <FormState> _formkey = GlobalKey();
  bool _IsSignIn=false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Sign In Page"),
        ),
        body: SingleChildScrollView(
            child:

            //LogIn Screeen code
            Padding(
              padding: EdgeInsets.all(5),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Center(
                      child: Padding(padding: EdgeInsets.only(top: 100),

                        child: Text("Flutter", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.blueAccent
                        ),),),
                    ),

                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cant be Empty";
                        }
                        else if (!value.contains("@")) {
                          return "invalid email";
                        }
                        else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder()

                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cant be Empty";
                        }
                        else if (value.length < 4) {
                          return "Password cant be less than 4";
                        }
                        else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder()

                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Forget Password..?", style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        _logIn();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: 50,
                        width: 200,
                        child: Center(child:
                        _IsSignIn==true? CircularProgressIndicator(color: Colors.white,):
                        Text("SigIn", style: TextStyle(
                            color: Colors.white
                        ),)),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 200,left: 80), child: Row(
                      children: [
                        Text("New User Create acount..."),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                    return SignUpPage();
                                  }));
                            },
                            child: Text("SignUp", style: TextStyle(
                                fontWeight: FontWeight.bold),))
                      ],
                    ),)


                  ],
                ),
              ),
            ))

    );
  }
  _logIn() async {
if(_formkey.currentState!.validate()){
  setState(() {
    _IsSignIn==true;
  });
  final auth=FirebaseAuth.instance;
 try{
   await auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) => {
     Navigator.push(
         context, MaterialPageRoute(builder: (c) {
       return SuccessPage();
     }))

   });

 }
 on FirebaseAuthException
 catch(e){
   setState(() {
     _IsSignIn=false;
   });
   if(e.code=="user-not-found"){
     Fluttertoast.showToast(msg: "User Not Found");

   } else if(e.code=="wrong-password"){
     Fluttertoast.showToast(msg: "Invalid Email or password");

   }
   else{
     Fluttertoast.showToast(msg: "Error:${e}");
   }
 }

}
  }


}



