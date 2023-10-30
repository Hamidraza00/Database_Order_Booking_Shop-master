class ProductsModel{
   int? productCode;
   String?productName;
   String?uom;
   String? price;

   ProductsModel({
    this.productCode,
    this.productName,
    this.uom,
     this.price,
  });

  // Create a factory constructor to create a Product instance from a map
  factory ProductsModel.fromMap(Map<dynamic, dynamic> json) {
    return ProductsModel(
      productCode: json['productCode'],
      productName: json['productName'],
      uom: json['uom'],
      price: json['price'],
    );
  }

  // Create a method to convert a Product instance to a map
  Map<String, dynamic> toMap() {
    return {
      'productCode': productCode,
      'productName': productName,
      'uom': uom,
      'price': price,
    };
  }
}
