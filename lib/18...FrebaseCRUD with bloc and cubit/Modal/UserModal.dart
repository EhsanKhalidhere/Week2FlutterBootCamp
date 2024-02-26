import 'package:cloud_firestore/cloud_firestore.dart';

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