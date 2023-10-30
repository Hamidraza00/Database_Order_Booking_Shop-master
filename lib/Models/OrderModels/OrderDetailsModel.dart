class OrderDetailsModel {
  int? id;
  String? productCode;
  String? productName;
  String? uom;
  String? price;
  int? quantity;

  OrderDetailsModel({
    this.id,
    this.productCode,
    this.productName,
    this.uom,
    this.price,
    this.quantity,
  });

  factory OrderDetailsModel.fromMap(Map<dynamic, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      productCode: json['productCode'],
      productName: json['productName'],
      uom: json['uom'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productCode': productCode,
      'productName': productName,
      'uom': uom,
      'price': price,
      'quantity': quantity,
    };
  }
}