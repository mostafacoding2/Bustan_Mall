class CustomersModel {
  final String id;
  final String object;
  final int balance;
  final int created;
  final String name;
  const CustomersModel({
    required this.id,
    required this.object,
    required this.balance,
    required this.created,
    required this.name,
  });
  factory CustomersModel.fromJson(Map<String, dynamic> json) {
    return CustomersModel(
        id: json['id'],
        object: json['object'],
        balance: json['balance'],
        created: json['created'],
        name: json['name']);
  }
}
