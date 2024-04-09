import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Model/UserModel.dart';

class DbHelper{
  Database? _database;

  static String TABLENAME= "UserTable";
  static String USERNAME = "UserName";
  static String PASSWORD = "Password";
  static String Id = "UserId";

  Future<Database> getDb() async {
    if (_database != null) {

      return _database!;
    } else {

      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "NotesDb.db");
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        log("DataBase is created");
        db.execute(
            "create table $TABLENAME($Id integer primary key autoincrement , $USERNAME text, $PASSWORD text)");
      },
    );
    return _database!;
  }

  Future<bool> AddData(UserModle userModle) async {
    var db = await getDb();
    var count = await db.insert(TABLENAME, userModle.toMap());
    log("data added");
    return count > 0;
  }

  Future<List<UserModle>> FetchData() async {
    var db = await getDb();
    List<UserModle> arrList = [];
    var data = await db.query(TABLENAME);
    for (Map<String, dynamic> eachdata in data) {
      UserModle noteModle = UserModle.fromMap(eachdata);
      arrList.add(noteModle);
    }
    return arrList;
  }
}