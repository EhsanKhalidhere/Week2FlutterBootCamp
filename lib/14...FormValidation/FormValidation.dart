import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week2/12...DropDown/MyDropDown.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  GlobalKey <FormState> _formkey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(

          title: Text("LogInPage"),
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
                       if( _formkey.currentState!.validate()){
                         Navigator.push(context, MaterialPageRoute(builder: (c){
                           return MyDropDown();
                         }));
                       }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: 50,
                        width: 200,
                        child: Center(child: Text("Login",style: TextStyle(
                            color: Colors.white
                        ),)),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 200),child: Text("New User Create acount..."),)


                  ],
                ),
              ),
            ))

    );
  }
}
