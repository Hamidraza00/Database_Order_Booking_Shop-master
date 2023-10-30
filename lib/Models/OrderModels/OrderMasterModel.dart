
import 'dart:ffi';

class OrderMasterModel {
  int? orderId;
  String? shopName;
  String? ownerName;
  String? phoneNo;
  String? brand;

  OrderMasterModel({
   required this.orderId,
    this.shopName,
    this.ownerName,
    this.phoneNo,
    this.brand,
  });

  factory OrderMasterModel.fromMap(Map<dynamic, dynamic> json) {
    return OrderMasterModel(
      orderId: json['orderId'],
      shopName: json['shopName'],
      ownerName: json['ownerName'],
      phoneNo: json['phoneNo'],
      brand: json['brand'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'shopName': shopName,
      'ownerName': ownerName,
      'phoneNo': phoneNo,
      'brand': brand,
    };
  }
}