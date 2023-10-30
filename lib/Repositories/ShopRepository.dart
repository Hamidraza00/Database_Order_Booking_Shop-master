import 'package:order_booking_shop/Databases/DBHelper.dart';

import 'package:order_booking_shop/Models/ShopModel.dart';

import '../Databases/Util.dart';

class ShopRepository {

  DBHelper dbHelper = DBHelper();



  Future<List<ShopModel>> getShop() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient!.query(tableName, columns: ['id', 'shopName' , 'city' , 'shopAddress' , 'ownerName' , 'ownerCNIC' , 'phoneNo' , 'alternativePhoneNo']);
    List<ShopModel> shop = [];

    for (int i = 0; i < maps.length; i++) {
      shop.add(ShopModel.fromMap(maps[i]));
    }
    return shop;
  }

  // Future<List<ShopModel>> getShopName() async {
  //   var dbClient = await dbHelper.db;
  //   List<Map> maps = await dbClient!.query(tableName, columns: ['id', 'shopName']);
  //   List<ShopModel> shop = [];
  //
  //   for (int i = 0; i < maps.length; i++) {
  //     shop.add(ShopModel.fromMap(maps[i]));
  //   }
  //   return shop;
  // }


  Future<int> add(ShopModel shopModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient!.insert(tableName , shopModel.toMap());
  }

  Future<int> update(ShopModel shopModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient!.update(tableName, shopModel.toMap(),
        where: 'id=?', whereArgs: [shopModel.id] );
  }

  Future<int> delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient!.delete(tableName,
        where: 'id=?', whereArgs: [id] );
  }
}



