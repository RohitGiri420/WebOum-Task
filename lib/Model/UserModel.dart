import '../Database/DbHelper.dart';

class UserModle {
  DbHelper db = DbHelper();
  int? id;
  String Username;
  String Password;

  UserModle({required this.Username, required this.Password, this.id});

  factory UserModle.fromMap(Map<String, dynamic> map) {
    return UserModle(Username: map[DbHelper.USERNAME], Password: map[DbHelper.PASSWORD], id: map[DbHelper.Id]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.Id:id,
      DbHelper.USERNAME:Username,
      DbHelper.PASSWORD:Password,
    };
  }
}

