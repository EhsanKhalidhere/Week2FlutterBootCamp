part of 'themes_bloc.dart';

abstract class ThemesState extends Equatable {
  const ThemesState();
}

class ThemesInitial extends ThemesState {
  @override
  List<Object> get props => [];
}
class ThemesLoaded extends ThemesState {
  final ThemeData themeData;
  ThemesLoaded( {required this.themeData});
  @override
  List<Object> get props => [themeData];
}
class PreservedThemesLoaded extends ThemesState {
  final String name;
  PreservedThemesLoaded( {required this.name});
  @override
  List<Object> get props => [name];
}

