class ShopModel{

  int? id;
  String? shopName;
  String? city;
  String? shopAddress;
  String? ownerName;
  String? ownerCNIC;
  String? phoneNo;
  String? alternativePhoneNo;

  ShopModel({this.id,this.shopName,this.city,this.shopAddress,this.ownerName,this.ownerCNIC,this.phoneNo,this.alternativePhoneNo});

  factory ShopModel.fromMap(Map<dynamic,dynamic> json){
    return ShopModel(
        id: json['id'],
        shopName: json['shopName'],
        city: json['city'],
        shopAddress: json['shopAddress'],
        ownerName:json['ownerName'],
        ownerCNIC: json['ownerCNIC'],
        phoneNo: json['phoneNo'],
        alternativePhoneNo: json['alternativePhoneNo']
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'shopName':shopName,
      'city': city,
      'shopAddress':shopAddress,
      'ownerName':ownerName,
      'ownerCNIC':ownerCNIC,
      'phoneNo':phoneNo,
      'alternativePhoneNo': alternativePhoneNo
    };
  }
}

