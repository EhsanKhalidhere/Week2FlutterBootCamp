import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:week2/18...FrebaseCRUD%20with%20bloc%20and%20cubit/database_handler/DatabseHandler.dart';







part 'firebase_cruds_state.dart';

class FirebaseCrudsCubit extends Cubit<FirebaseCrudsState> {
  FirebaseCrudsCubit() : super(FirebaseCrudsInitial());
  void readData(){
    try{
      emit(FirebaseCrudsLoadig());
      final StreamResponse=DatabaseHandler.readData();
      StreamResponse.listen((user) {
        emit(FirebaseCrudsLoaded(user));});



    }
    catch(e){
      emit(FirebaseCrudsFailure());
    }
  }
  void createData(user){
    try{
      if(state is FirebaseCrudsLoaded){
        DatabaseHandler.creatData(user);
      }

    }
    catch(e){
      emit(FirebaseCrudsFailure());
    }

  }
  void updateData(user){
    try{
      if(state is FirebaseCrudsLoaded){
        DatabaseHandler.updateData(user);
      }

    }
    catch(e){
      emit(FirebaseCrudsFailure());
    }

  }
  void deleteData(String id){
    try{
      if(state is FirebaseCrudsLoaded){
        DatabaseHandler.deleteData(id);
      }

    }
    catch(e){
      emit(FirebaseCrudsFailure());
    }


  }
}

