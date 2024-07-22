import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:equatable/equatable.dart';
class ShopsModel extends Equatable {
  final int? id;
  final String? name;
  final String? imagePath;
  final String? theDoorNumber;
  final String? phoneNumber;
  final List<ProductModel>? productDtOs;
  const ShopsModel({
    required this.imagePath,
    required this.id,
    required this.name,
    required this.theDoorNumber,
    required this.phoneNumber,
    required this.productDtOs});
  @override
  List<Object?> get props =>
      [id, name, imagePath, theDoorNumber, phoneNumber, productDtOs,];

  factory ShopsModel.fromJson(Map<String, dynamic> json){
    return ShopsModel(
        id: json["id"],
        name: json["name"],
        imagePath: json["imagePath"],
        theDoorNumber: json["theDoorNumber"],
        phoneNumber: json["phoneNumber"],
        productDtOs: json["productDTOs"] == null
            ? null
            : (json["productDTOs"] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList()
    );
  }
}