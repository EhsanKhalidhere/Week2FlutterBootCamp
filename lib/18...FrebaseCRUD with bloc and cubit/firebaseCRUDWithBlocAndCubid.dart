import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week2/16...Bloc+Cubid/counter/counter_bloc.dart';
import 'package:week2/18...FrebaseCRUD%20with%20bloc%20and%20cubit/bloc/firebase_crud_bloc.dart';

import 'Modal/UserModal.dart';

class FirebaseCRUDBloc extends StatefulWidget {
  const FirebaseCRUDBloc({super.key});

  @override
  State<FirebaseCRUDBloc> createState() => _FirebaseCRUDBlocState();
}

class _FirebaseCRUDBlocState extends State<FirebaseCRUDBloc> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCrudBloc()..add(ReadDataEvent()),
      child: MaterialApp(
          home: FirebaseCrudHome()
      ),
    );
  }
}

class FirebaseCrudHome extends StatefulWidget {
  const FirebaseCrudHome({super.key});

  @override
  State<FirebaseCrudHome> createState() => _FirebaseCrudHomeState();
}

class _FirebaseCrudHomeState extends State<FirebaseCrudHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase CRUD Operation"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                BlocProvider.of<FirebaseCrudBloc>(context).add(CreateDataEvent(
                User(
                  email:"Ehsan@gmail",
                      username:"ehsan"


                )
                ));
                }, child: Text("Create Data"),

              ),
            ),
       BlocBuilder(builder: (context,state){
         if(state is FirebaseCrudLoading){
           return Center(child:CircularProgressIndicator());
         }
         if(state is FirebaseCrudFailure){
           return Center( child: Text("Something Went Wrong"),);
         }
         if(state is FirebaseCrudLoaded){
           final users=state.users;
           return users.isEmpty ? Center(child:Text("No Data")):

           Padding(padding: EdgeInsets.all(8)
               , child: Column(
                 children: users!.map((user) {
                   return ListTile(
                     leading: InkWell(
                       onTap: () {
                         BlocProvider.of<FirebaseCrudBloc>(context).add(DeleteDataEvent(user.id!));
                       },
                       child: Icon(Icons.delete_rounded),
                     ),
                     title: Text("${user.username}"),
                     subtitle: Text("${user.email}"),
                     trailing: InkWell(
                       onTap: () {
                         BlocProvider.of<FirebaseCrudBloc>(context).add(UpdateDataEvent(User(
                             username: "updatedName",
                             email: "updatedEmail"
                         )));

                       },
                       child: Icon(Icons.update),
                     ),
                   );
                 }).toList(),
               ));
         }
         return Center( child: CircularProgressIndicator(),);

       })
          ],
        ),
      ),

    );
  }
}

