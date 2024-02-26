import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseCRUD extends StatefulWidget {
  const FirebaseCRUD({super.key});

  @override
  State<FirebaseCRUD> createState() => _FirebaseCRUDState();
}

class _FirebaseCRUDState extends State<FirebaseCRUD> {

  _creatData(User user){
    final userCollection=FirebaseFirestore.instance.collection("Users");
    final id=userCollection.doc().id;
    final newUser=User(
      username:user.username,
      id: id,
      email: user.email

    ).toJason();
    userCollection.doc(id).set(newUser);
  }
 Stream<List<User>> _readData(){
   final userCollection=FirebaseFirestore.instance.collection("Users");
   return userCollection.snapshots().map((value) => value.docs.map((e) => User.fromSnapshot(e)).toList());
 }
 _updateData(User user){
    final userCollection=FirebaseFirestore.instance.collection("Users");
    final newData=User(

   username: user.username,
      id: user.id,
      email: user.email
    ).toJason();
    userCollection.doc(user.id).update(newData);

 }
 _deleteData(String id){
    final userCollection=FirebaseFirestore.instance.collection("Users");
    userCollection.doc(id).delete();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Firebase CRUD Operation"),),
      body:    SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: (){
                  _creatData(User (
                    username:"ehsan",
                        email:"ehsankhalid@gmail.com"

                  ));



                }, child: Text("Create Data"),

              ),
            ),
           StreamBuilder<List<User>>(
                stream: _readData(),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if(snapshot.data!.isEmpty){
                    return Text("No data");
                  }
                  final Users=snapshot.data;

              return SingleChildScrollView(
                child: Padding(padding: EdgeInsets.all(8)
                ,child:Column(
                      children:Users!.map((user){
                        return ListTile(
                          leading: InkWell(
                            onTap: (){
                              _deleteData(user.id!);
                            },
                            child: Icon(Icons.delete_rounded),
                          ),
                          title: Text("${user.username}"),
                          subtitle: Text("${user.email}"),
                          trailing: InkWell(
                            onTap: (){
                              _updateData(User(
                                id: user.id,
                                email: "updated@gmail.com",
                                username: "updatedName"
                              )

                              );
                              
                            },
                            child: Icon(Icons.update),
                          ),
                        );
                      }).toList() ,
                    )),
              );
            })

          ],
        ),
      ),
      
    );
  }
}
class User{
  String? username;
  String? email;
  String? id;
  User({this.username,this.email,this.id});
 static User fromSnapshot(DocumentSnapshot<Map<String,dynamic>> snapshot){
   return User(
     username: snapshot["username"],
     id: snapshot["id"],
       email: snapshot['email']
     
   );
 }

  Map<String,dynamic> toJason(){
    return{
      "username":username,
      "email":email,
      "id":id

    };

  }
}