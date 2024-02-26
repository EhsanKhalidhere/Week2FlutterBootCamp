part of 'firebase_cruds_cubit.dart';


abstract class FirebaseCrudsState extends Equatable {
  const FirebaseCrudsState();
}
class FirebaseCrudsInitial extends FirebaseCrudsState {
  @override
  List<Object> get props => [];
}

class FirebaseCrudsLoadig extends FirebaseCrudsState {
  @override
  List<Object> get props => [];
}
class FirebaseCrudsLoaded extends FirebaseCrudsState {
  final List user;
  FirebaseCrudsLoaded(this.user);
  @override
  List<Object> get props => [user];
}
class FirebaseCrudsFailure extends FirebaseCrudsState {
  @override
  List<Object> get props => [];
}
