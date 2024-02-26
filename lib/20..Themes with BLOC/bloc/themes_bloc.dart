import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:week2/20..Themes%20with%20BLOC/preferences/ThemePreferences.dart';

import '../local/shared_preference.dart';


part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {

  ThemesBloc() : super(ThemesInitial()) {
    on<ChangeThemesEvent>((event, emit) {
      SharedPref.setThemeId(value: event.name);


      emit(ThemesLoaded(themeData: ThemePref.appThemeData[event.name]!)
      );
    });
    on<GetPreservedThemeEvent>((event, emit) {
      SharedPref.getThemeId().then((value) => add(GetPreservedThemesLoadEvent(value!)));

    });
    on<GetPreservedThemesLoadEvent>((event, emit) => emit(PreservedThemesLoaded(name: event.name)));

  }

}
