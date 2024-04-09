import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weboum/Cubit/UserState.dart';

import '../Database/DbHelper.dart';
import '../Model/UserModel.dart';

class Usercubit extends Cubit<UserState>{
  DbHelper dbHelper;

  Usercubit({required this.dbHelper}):super(InitialState());

  AddData(UserModle userModle) async {
    emit(LoadingState());
    bool check = await dbHelper.AddData(userModle);
    if (check) {
      var Notes = await dbHelper.FetchData();
      emit(LoadedState(arrlist: Notes,));
    }
    else {
      emit(ErrorState(ErrorMsg: "Error while adding data"));
    }
  }

  GetData() async {
    emit(LoadingState());
    var Notes = await dbHelper.FetchData();
    emit(LoadedState(arrlist: Notes));
  }


}