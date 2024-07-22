import 'package:ultra_shop/features/product/data/models/product_model.dart';

class ProductbySortReviewModel {
  final int? id;
  final String? categoryName;
  final String? itemName;
  final int? priceProd;
  final String? descrip;
  final int? solditemsProd;
  final int? quantityProd;
  final int? averageRate;
  final ShopModel? shop;
  final List<String>? imageUrls;

  const ProductbySortReviewModel(
      {required this.id,
      required this.categoryName,
      required this.itemName,
      required this.priceProd,
      required this.descrip,
      required this.solditemsProd,
      required this.quantityProd,
      required this.averageRate,
      required this.shop,
      required this.imageUrls});

  factory ProductbySortReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductbySortReviewModel(
        id: json['id'],
        categoryName: json['categoryName'],
        itemName: json['item_Name'],
        priceProd: json['priceProd'],
        descrip: json['descrip'],
        solditemsProd: json['solditemsProd'],
        quantityProd: json['quantityProd'],
        averageRate: json['averageRate'],
        shop: json["shop"] == null ? null : ShopModel.fromJson(json["shop"]),
        imageUrls: json["imageUrls"] == null
            ? null
            : List<String>.from(json["imageUrls"]));
  }
}
