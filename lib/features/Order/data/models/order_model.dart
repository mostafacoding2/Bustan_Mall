import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final List<ProductsOrder>? products;
  final double? oerderPrice;
  final String? productStatus;
  final String? oerderDate;
  final String? orderNumber;

  const OrderModel({this.products,
    this.oerderPrice,
    this.productStatus,
    this.oerderDate,
    this.orderNumber});

  @override
  List<Object?> get props =>
      [products, oerderPrice, productStatus, oerderDate, orderNumber,];

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        products: json["products"] == null
            ? null
            : (json["products"] as List)
            .map((e) => ProductsOrder.fromJson(e))
            .toList(),
        oerderPrice: json["oerderPrice"],
        productStatus: json["productStatus"],
        oerderDate: json["oerderDate"],
        orderNumber: json["orderNumber"]);
  }
}

class ProductsOrder extends Equatable {
  final String? name;
  final String? description;
  final double? price;
  final int? quantity;
  final List<String>? images;

  const ProductsOrder({this.images, this.name, this.description, this.price, this.quantity});

  factory ProductsOrder.fromJson(Map<String, dynamic> json) {
    return ProductsOrder(
        images: json["images"] == null ? null : List<String>.from(json["images"]),
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"]);
  }

  @override
  List<Object?> get props => [name, description, price, quantity,images];
}
