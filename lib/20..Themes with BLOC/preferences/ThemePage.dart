import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week2/20..Themes%20with%20BLOC/bloc/themes_bloc.dart';

import 'ThemePreferences.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Prefrences"),
      ),
      body: ListView.builder(


          itemCount: ThemePref.themePrefList.length,

          itemBuilder: (contex, index) {
            final _selectedTheme=ThemePref.themePrefList[index];
        return GestureDetector(
          onTap: (){
            BlocProvider.of<ThemesBloc>(context).add(ChangeThemesEvent(name: _selectedTheme));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            margin: EdgeInsets.all(8),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ThemePref.appThemeData[_selectedTheme]!.primaryColor,
              border: Border.all(width: 1,color: Colors.black),
              borderRadius: BorderRadius.circular(10)

            ),
            child: Center(child: Text(_selectedTheme,style: ThemePref.appThemeData[_selectedTheme]!.textTheme.bodyMedium,)),
          ),
        );

      }

      ),
    );
  }
}
