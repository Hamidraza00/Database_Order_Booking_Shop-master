
import 'package:order_booking_shop/Databases/OrderDatabase/DBHelperOrderMaster.dart';
import 'package:order_booking_shop/Models/OrderModels/OrderMasterModel.dart';

import '../../Databases/OrderDatabase/DBHelperOrderDetails.dart';
import '../../Databases/UtilOrder.dart';
import '../../Models/OrderModels/OrderDetailsModel.dart';

class OrderDetailsRepository {

  DBHelperOrderDetails dbHelperOrderDetails = DBHelperOrderDetails();

  Future<List<OrderDetailsModel>> getOrderDetails() async {
    var dbClient = await dbHelperOrderDetails.db;
    List<Map> maps = await dbClient.query(tableName2, columns: [
      'id',
      'productCode',
      'productName',
      'uom',
      'price',
      'quantity'
    ]);
    List<OrderDetailsModel> orderdetails = [];
    for (int i = 0; i < maps.length; i++) {
      orderdetails.add(OrderDetailsModel.fromMap(maps[i]));
    }
    return orderdetails;
  }

  Future<int> add(OrderDetailsModel orderdetailsModel) async {
    var dbClient = await dbHelperOrderDetails.db;
    return await dbClient.insert(tableName3, orderdetailsModel.toMap());
  }

  Future<int> update(OrderDetailsModel orderdetailsModel) async {
    var dbClient = await dbHelperOrderDetails.db;
    return await dbClient.update(tableName3, orderdetailsModel.toMap(),
        where: 'id = ?', whereArgs: [orderdetailsModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelperOrderDetails.db;
    return await dbClient.delete(tableName3,
        where: 'id = ?', whereArgs: [id]);
  }

}