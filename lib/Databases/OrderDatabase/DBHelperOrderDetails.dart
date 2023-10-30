import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperOrderDetails{

  static Database? _db;

  Future<Database> get db async{
    if(_db != null)
    {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,'orderdetails.db');
    var db = openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db, int version){
     db.execute("CREATE TABLE orderDetails (id INTEGER PRIMARY KEY,product_code TEXT,quantity INTEGER,product_name TEXT,uom TEXT,price TEXT,FOREIGN KEY (id) REFERENCES OrderMaster(id))");
}
}

