import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? categoryName;
  final String? itemName;
  final int? priceProd;
  final int? averageRate;
  final String? descrip;
  final int? solditemsProd;
  final int? quantityProd;
  final ShopModel? shop;
  final List<String>? imageUrls;
  final List<RevDtoModel> revDto;

  const ProductModel(
      {required this.averageRate, required this.id, required this.categoryName, required this.itemName, required this.priceProd, required this.descrip, required this.solditemsProd, required this.quantityProd, required this.shop, required this.imageUrls, required this.revDto,});

  @override
  List<Object?> get props =>
      [
        id,
        categoryName,
        itemName,
        priceProd,
        averageRate,
        descrip,
        solditemsProd,
        quantityProd,
        shop,
        imageUrls,
        revDto,
      ];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        averageRate: json['averageRate'],
        id: json["id"],
        categoryName: json["categoryName"],
        itemName: json["item_Name"],
        priceProd: json["priceProd"],
        descrip: json["descrip"],
        solditemsProd: json["solditemsProd"],
        quantityProd: json["quantityProd"],
        shop: json["shop"] == null ? null : ShopModel.fromJson(json["shop"]),
        imageUrls: json["imageUrls"] == null ? null : List<String>.from(
            json["imageUrls"]),
        revDto: (json["revDTO"] as List)
            .map((e) => RevDtoModel.fromJson(e))
            .toList()
    );
  }
}

class RevDtoModel extends Equatable {
  final int? rating;
  final String? comment;

  const RevDtoModel({required this.rating, required this.comment});
  @override
  List<Object?> get props => [rating, comment];

  factory RevDtoModel.fromJson(Map<String, dynamic> json) {
    return RevDtoModel(rating: json["rating"], comment: json["comment"]);
  }
}
class ShopModel extends Equatable {
  final int? id;
  final String? name;
  final String? theDoorNumber;
  final String? phoneNumber;
  final dynamic productDtOs;

  const ShopModel(
      {required this.id, required this.name, required this.theDoorNumber, required this.phoneNumber, required this.productDtOs});

  @override
  List<Object?> get props =>
      [id, name, theDoorNumber, phoneNumber, productDtOs,];

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(id: json["id"],
        name: json["name"],
        theDoorNumber: json["theDoorNumber"],
        phoneNumber: json["phoneNumber"],
        productDtOs: json["productDTOs"]
    );
  }
}