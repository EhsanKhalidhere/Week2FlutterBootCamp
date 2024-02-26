part of 'firebase_crud_bloc.dart';

abstract class FirebaseCrudEvent extends Equatable {
  const FirebaseCrudEvent();
}
class CreateDataEvent extends FirebaseCrudEvent{
final User user;
CreateDataEvent(this.user);

  @override
  // TODO: implement props
  List<Object?> get props {
    return [user];
  }
}
class UpdateDataEvent extends FirebaseCrudEvent{
  final User user;
  UpdateDataEvent(this.user);

  @override
  // TODO: implement props
  List<Object?> get props {
    return [user];
  }
}
class DeleteDataEvent extends FirebaseCrudEvent{
  final String id;
  DeleteDataEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id];
  }
}
class ReadDataEvent extends FirebaseCrudEvent{

  @override
  // TODO: implement props
  List<Object?> get props {
    return throw UnimplementedError();
  }
}

class LoadDataEvent extends FirebaseCrudEvent{
  final List<User > users;
  LoadDataEvent(this.users);

  @override
  // TODO: implement props
  List<Object?> get props {
    return [users];
  }
}


