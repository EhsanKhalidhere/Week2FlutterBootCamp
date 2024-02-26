import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week2/20..Themes%20with%20BLOC/preferences/ThemePage.dart';
import 'package:week2/20..Themes%20with%20BLOC/preferences/ThemePreferences.dart';

import 'bloc/themes_bloc.dart';

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {

  _switchTheme(String name){
    switch(name){
      case ThemePref.lightTheme:{
        return ThemePref.appThemeData[ThemePref.lightTheme];
      }
      case ThemePref.darkTheme:{
        return ThemePref.appThemeData[ThemePref.darkTheme];
      }
      case ThemePref.deepOrangeThemeLight:{
        return ThemePref.appThemeData[ThemePref.deepOrangeThemeLight];
      }
      case ThemePref.deepPurpleThemeLight:{
        return ThemePref.appThemeData[ThemePref.deepPurpleThemeLight];
      }

    }

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemesBloc()..add(GetPreservedThemeEvent()),
      child: BlocBuilder<ThemesBloc, ThemesState>(
        builder: (context, state) {
          if(state is PreservedThemesLoaded){
            return MaterialApp(
              theme: _switchTheme(state.name),
              home: ThemeHome(),
            );
          }
          if(state is ThemesLoaded){
          return MaterialApp(
            theme: state.themeData,
            home: ThemeHome(),

          );}
          return  MaterialApp(
            home: ThemeHome(),

          );}

      ),
    );
  }
}

class ThemeHome extends StatefulWidget {
  const ThemeHome({super.key});

  @override
  State<ThemeHome> createState() => _ThemeHomeState();
}


class _ThemeHomeState extends State<ThemeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Prefrences"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ThemePage()));
            },
            child: Icon(Icons.settings_rounded),
          )

        ],
      ),
      body: Center(
        child: Text("Play With Themese", style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
