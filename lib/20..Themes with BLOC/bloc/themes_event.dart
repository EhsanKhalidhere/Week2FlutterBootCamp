part of 'themes_bloc.dart';

abstract class ThemesEvent extends Equatable {
  const ThemesEvent();

}
 class ChangeThemesEvent extends ThemesEvent {
  final String name;
 ChangeThemesEvent({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];

}
class GetPreservedThemeEvent extends ThemesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class GetPreservedThemesLoadEvent extends ThemesEvent {
 final String name;
 GetPreservedThemesLoadEvent ( this.name);

 @override
 // TODO: implement props
 List<Object?> get props => [name];

}
