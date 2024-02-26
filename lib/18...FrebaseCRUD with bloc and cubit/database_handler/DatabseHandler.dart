
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Modal/UserModal.dart';


class DatabaseHandler{
  static creatData(User user){
    final userCollection=FirebaseFirestore.instance.collection("Users");
    final id=userCollection.doc().id;
    final newUser=User(
        username:user.username,
        id: id,
        email: user.email

    ).toJason();
    userCollection.doc(id).set(newUser);
  }
  static Stream<List<User>> readData(){
    final userCollection=FirebaseFirestore.instance.collection("Users");
    return userCollection.snapshots().map((value) => value.docs.map((e) => User.fromSnapshot(e)).toList());
  }
  static updateData(User user){
    final userCollection=FirebaseFirestore.instance.collection("Users");
    final newData=User(

        username: user.username,
        id: user.id,
        email: user.email
    ).toJason();
    userCollection.doc(user.id).update(newData);

  }
  static deleteData(String id){
    final userCollection=FirebaseFirestore.instance.collection("Users");
    userCollection.doc(id).delete();
  }
}