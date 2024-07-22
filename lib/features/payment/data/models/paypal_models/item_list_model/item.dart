class OrderItemModel {
  String? name;
  int? quantity;
  String? price;

  OrderItemModel({this.name, this.quantity, this.price, });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        name: json['name'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
    "currency": "USD",
      };
}
