
class OrderMasterModel {
  int? id;
  String? shopName;
  String? ownerName;
  String? phoneNo;
  String? brand;

  OrderMasterModel({
    this.id,
    this.shopName,
    this.ownerName,
    this.phoneNo,
    this.brand,
  });

  factory OrderMasterModel.fromMap(Map<dynamic, dynamic> json) {
    return OrderMasterModel(
      id: json['id'],
      shopName: json['shopName'],
      ownerName: json['ownerName'],
      phoneNo: json['phoneNo'],
      brand: json['brand'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shopName': shopName,
      'ownerName': ownerName,
      'phoneNo': phoneNo,
      'brand': brand,
    };
  }
}