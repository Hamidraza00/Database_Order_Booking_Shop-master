
import '../../Databases/OrderDatabase/DBHelperProducts.dart';
import '../../Databases/UtilOrder.dart';
import '../../Models/ProductsModel.dart';

class ProductsRepository{

  DBHelperProducts dbHelperProducts = DBHelperProducts();

  Future<List<ProductsModel>> getProductsModel() async{
    var dbClient = await dbHelperProducts.db;
    List<Map> maps = await dbClient.query('products',columns: ['productCode','productName','uom','price','quantity']);
    List<ProductsModel> products = [];
    for(int i = 0; i<maps.length; i++)
    {
      products.add(ProductsModel.fromMap(maps[i]));
    }
    return products;
  }

  Future<int> add(ProductsModel productsModel) async{
    var dbClient = await dbHelperProducts.db;
    return await dbClient.insert('products', productsModel.toMap());
  }

  Future<int> update(ProductsModel productsModel) async{
    var dbClient = await dbHelperProducts.db;
    return await dbClient.update('products', productsModel.toMap(),
        where: 'productCode = ?', whereArgs: [productsModel.productCode]);
  }

  Future<int> delete(int productCode) async{
    var dbClient = await dbHelperProducts.db;
    return await dbClient.delete(tableName4,
        where: 'productCode = ?', whereArgs: [productCode]);
  }

}

