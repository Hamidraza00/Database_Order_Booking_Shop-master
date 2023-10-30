import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../../Models/OrderModels/OrderMasterModel.dart';

class DBHelperOrderMaster{

  static Database? _db;

  Future<Database> get db async{
    if(_db != null)
    {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Database>initDatabase() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,'ordermaster.db');
    var db = openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db, int version){
    db.execute("CREATE TABLE orderMaster (id TEXT PRIMARY KEY,shopName TEXT,ownerName TEXT,phoneNo TEXT,brand TEXT)");
  }
}

