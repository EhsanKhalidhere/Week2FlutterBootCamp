import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Modal/UserModal.dart';
import '../database_handler/DatabseHandler.dart';

part 'firebase_crud_event.dart';
part 'firebase_crud_state.dart';

class FirebaseCrudBloc extends Bloc<FirebaseCrudEvent, FirebaseCrudState> {
  StreamSubscription<List<User>>? _UserstreamSubscription;
  @override Future<void>close() async{
    await _UserstreamSubscription!.cancel();
    return super.close();
  }
  FirebaseCrudBloc() : super(FirebaseCrudInitial()) {



    on<ReadDataEvent>((event, emit){
      try{
        emit(FirebaseCrudLoading());
        final streamResponse=DatabaseHandler.readData();
        _UserstreamSubscription!.cancel();
       _UserstreamSubscription= streamResponse.listen((users) {
          add(LoadDataEvent(users));
        });
        

        }
        catch(_){
        emit(FirebaseCrudFailure());

    }

    });
    on<LoadDataEvent>((event, emit) {
      try{
        emit(FirebaseCrudLoaded(event.users));
      }
      catch(_){
        emit(FirebaseCrudFailure());

      }
    });
    on<CreateDataEvent>((event, emit) {
     try{
       if(state is FirebaseCrudLoaded){
         DatabaseHandler.creatData(event.user);
       }
     }
      catch(e){
       emit(FirebaseCrudFailure());
      }


    });
    on<UpdateDataEvent>((event,emit){
      try{
        if(state is FirebaseCrudLoaded){
          DatabaseHandler.updateData(event.user);
        }
      }
      catch(e){
        emit(FirebaseCrudFailure());
      }


    });
    on<DeleteDataEvent>((event,emit){
      try{
        if(state is FirebaseCrudLoaded){
          DatabaseHandler.deleteData(event.id);
        }
      }
      catch(e){
        emit(FirebaseCrudFailure());
      }


    });



  }

}
