import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:week2/10...AlertDailogBox/MyAlertDialog.dart';
import 'package:week2/12...DropDown/MyDropDown.dart';
import 'package:week2/21...Firebase_email/SignUp_Page.dart';
import 'package:week2/4..Drawer/DrawerPage.dart';
import 'package:week2/7...RadioButton/MyRadioButtons.dart';
import 'package:week2/8...CheckBox/MyCheckBox.dart';
import 'package:week2/9..SwtichButton/MySwitchButton.dart';

import '1..Routes/Routes.dart';
import '11...Card/MyCard.dart';
import '13...BottomModalSheet/MyModelBottomSheet.dart';
import '14...FormValidation/FormValidation.dart';
import '15...firebase_CRUD/firebaseCRUD.dart';
import '16...Bloc+Cubid/MyBLock.dart';
import '17..Cubid Counter Application/MyCubid.dart';
import '2..SnackBar+ToastMessage/Snackbar.dart';
import '2..SnackBar+ToastMessage/ToastPage.dart';
import '20..Themes with BLOC/themes.dart';
import '21...Firebase_email/Sign_In_Page.dart';
import '21...Firebase_email/suucessPage.dart';
import '3..BottomNavBar/BottomNavBar.dart';
import '3..BottomNavBar/presistanNavBar.dart';
import '5...TabBar/MyTabBar.dart';
import '6...PopUp/MyPopUp.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(

                primarySwatch: Colors.blue,
              ),
              home: SuccessPage(),
            );
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              primarySwatch: Colors.blue,
            ),
            home: SignInPage(),
          );


    });


  }
}


