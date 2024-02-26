import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:week2/21...Firebase_email/suucessPage.dart';

import 'Sign_In_Page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _IsSignup=false;

  GlobalKey <FormState> _formkey=GlobalKey();
  TextEditingController _userNameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        appBar: AppBar(

          title: Text("Sign Up Page"),
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

                        child: Text("Flutter",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.blueAccent
                        ),),),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _userNameController,
                      validator: (value){
                        if(value!.isEmpty){
                          return"UserName cant be Empty";

                        }
                        else{
                          return null;
                        }


                      },
                      decoration: InputDecoration(
                          hintText: "UserName",
                          border: OutlineInputBorder()

                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _emailController,
                      validator: (value){
                        if(value!.isEmpty){
                          return"Email cant be Empty";

                        }
                        else if(!value.contains("@")){
                          return"invalid email";

                        }
                        else{
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
                      validator: (value){
                        if(value!.isEmpty){
                          return"Email cant be Empty";

                        }
                        else if(value.length<4){
                          return"Password cant be less than 4";

                        }
                        else{
                          return null;
                        }


                      },

                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder()

                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Forget Password..?",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        _signup();

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: 50,
                        width: 200,
                        child: Center(child: _IsSignup==true? CircularProgressIndicator(color:Colors.white70,): Text("SignUp",style: TextStyle(
                            color: Colors.white
                        ),)),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 150,left: 80), child: Row(
                      children: [
                        Text("Already have an Acount...!"),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                    return SignInPage();
                                  }));
                            },
                            child: Text("Login", style: TextStyle(
                              color: Colors.blue,
                                fontWeight: FontWeight.bold),))
                      ],
                    ),)


                  ],
                ),
              ),
            ))

    );}

  _signup() async{
    if( _formkey.currentState!.validate()){
      setState(() {
        _IsSignup=true;
      });
      final auth=FirebaseAuth.instance;
   try{
     await auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) => (

         Navigator.push(context, MaterialPageRoute(builder: (c){
           return SignInPage();
         }))

     ));
   }
   on FirebaseAuthException catch(e){
     setState(() {
       _IsSignup=false;
     });
     if(e.code=="email-already-in-use"){
       return Fluttertoast.showToast(msg: "The Acount Already Exist");

     }
     else if(e.code=="weak-password"){
       return Fluttertoast.showToast(msg: "The password must be more than 6 digit");}
     else{
       Fluttertoast.showToast(msg: "Error:${e}");

     }
   }
    }


  }
}
