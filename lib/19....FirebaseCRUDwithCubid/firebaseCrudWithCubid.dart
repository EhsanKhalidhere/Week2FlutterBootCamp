import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week2/19....FirebaseCRUDwithCubid/cubid/firebase_cruds_cubit.dart';

import 'Modal/UserModal.dart';

class FirebaseCrudWithCubid extends StatefulWidget {
  const FirebaseCrudWithCubid({super.key});

  @override
  State<FirebaseCrudWithCubid> createState() => _FirebaseCrudWithCubidState();
}

class _FirebaseCrudWithCubidState extends State<FirebaseCrudWithCubid> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCrudsCubit()..readData(),
      child: MaterialApp(
        home: FirebaseCrudCubidHome(),
      ),
    );
  }
}

class FirebaseCrudCubidHome extends StatefulWidget {
  const FirebaseCrudCubidHome({super.key});

  @override
  State<FirebaseCrudCubidHome> createState() => _FirebaseCrudCubidHomeState();
}

class _FirebaseCrudCubidHomeState extends State<FirebaseCrudCubidHome> {
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
                  BlocProvider.of<FirebaseCrudsCubit>(context).createData(
                          User(
                              email: "Ehsan@gmail",
                              username: "ehsan"


                          )
                      );
                }, child: Text("Create Data"),

              ),
            ),
            BlocBuilder<FirebaseCrudsCubit,FirebaseCrudsState>(builder: (context, state) {
              if (state is FirebaseCrudsLoadig) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is FirebaseCrudsFailure) {
                return Center(child: Text("Something Went Wrong"),);
              }
              if (state is FirebaseCrudsLoaded) {
                final users = state.user;
                return users.isEmpty ? Center(child: Text("No Data")) :

                Padding(padding: EdgeInsets.all(8)
                    , child: Column(
                      children: users!.map((user) {
                        return ListTile(
                          leading: InkWell(
                            onTap: () {
                              BlocProvider.of<FirebaseCrudsCubit>(context).deleteData(user.id);
                            },
                            child: Icon(Icons.delete_rounded),
                          ),
                          title: Text("${user.username}"),
                          subtitle: Text("${user.email}"),
                          trailing: InkWell(
                            onTap: () {
                              BlocProvider.of<FirebaseCrudsCubit>(context).updateData(
                                  User(
                                      email: "updatedehsan@gmail",
                                      username: "updatedehsan"


                                  )
                              );
                            },
                            child: Icon(Icons.update),
                          ),
                        );
                      }).toList(),
                    ));
              }
              return Center(child: CircularProgressIndicator(),);
            })
          ],
        ),
      ),

    );
  }
}

