import 'package:equatable/equatable.dart';
class ViewCartModel extends Equatable {
  final String? productName;
  final double? productPrice;
  final String? productDiscription;
  final int? quantity;
  final int? averageRate;
  final int? id;
 final List<String>?imageUrls;
  @override
  List<Object?> get props =>
      [productName, productPrice, productDiscription, quantity,id,averageRate,imageUrls];
 const ViewCartModel(
      { required this.id,
       required this.imageUrls,
      required this.averageRate,
        required this.productName, required this.productPrice,required this.productDiscription,required this.quantity});
  factory ViewCartModel.fromJson(Map<String, dynamic> json) {
    return ViewCartModel(imageUrls:json["imageUrls"] == null ? null : List<String>.from(json["imageUrls"]),
      averageRate: json['averageRate'],
        id:json['id'],
        productName: json["productName"],
        productPrice: json["productPrice"],
        productDiscription: json["productDiscription"],
        quantity: json["quantity"]);
  }


}