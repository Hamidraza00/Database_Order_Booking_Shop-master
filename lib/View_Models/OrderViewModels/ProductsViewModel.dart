import 'package:get/get.dart';
//import 'package:order_booking_shop/Models/OrderModels/OrderMasterModel.dart';
//import '../../Models/OrderModels/OrderMasterModel.dart';
import '../../Models/ProductsModel.dart';
import '../../Repositories/OrderRepository/OrderMasterRepository.dart';
import '../../Repositories/OrderRepository/ProductsRepository.dart';

class ProductsViewModel extends GetxController{

  var allProducts = <ProductsModel>[].obs;
  ProductsRepository productsRepository = ProductsRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllProductsModel();
  }

  fetchAllProductsModel() async{
    var products = await productsRepository.getProductsModel();
    allProducts.value = products;
  }

  addOrderMasterModel(ProductsModel productsModel){
    productsRepository.add(productsModel);
    fetchAllProductsModel();
  }

  updateOrderMasterModel(ProductsModel productsModel){
    productsRepository.update(productsModel);
    fetchAllProductsModel();
  }

  deleteOrderMasterModel(int id){
    productsRepository.delete(id);
    fetchAllProductsModel();
  }

}