import '../Model/UserModel.dart';

abstract class UserState {}

class InitialState extends UserState {}

class LoadingState extends UserState {}

class LoadedState extends UserState {
  List<UserModle> arrlist = [];
  int? id;
  LoadedState({required this.arrlist, this.id});
}

class ErrorState extends UserState {
  String ErrorMsg;

  ErrorState({required this.ErrorMsg});
}