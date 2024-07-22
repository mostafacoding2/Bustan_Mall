import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final bool isDeleted;
  final int id;
  final String name;
  final String description;
  final String picture;
  final int totalProducts;
  final List<ProductModel> productDtOs;

  const CategoryModel(
      {  required this.id,required this.picture, required this.isDeleted, required this.name, required this.description, required this.totalProducts, required this.productDtOs});

  factory CategoryModel.fromJson(Map<String, dynamic> json)
  {
    return CategoryModel(
        id:json['categoryId'],
        picture: json['picture'],
        isDeleted: json["isDeleted"],
        name: json["name"],
        description: json["description"],
        totalProducts: json["totalProducts"],
        productDtOs: (json["productDTOs"] as List).map((e) =>
            ProductModel.fromJson(e)).toList()
    );
  }

  @override
  List<Object> get props =>
      [isDeleted, name, description, picture, totalProducts, productDtOs,id];
}