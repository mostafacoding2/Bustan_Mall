import 'package:equatable/equatable.dart';
  class ShowUserModel extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? userName;
  final String? street;
  final String? city;
  final String? phone;
  final List<dynamic>? addresses;
  final List<String>? roles;
  const ShowUserModel(
      {   required this.firstName,required this.lastName,required this.email,required this.userName,required this.street,required
      this.city, required this.phone, required this.addresses,required this.roles});
  factory ShowUserModel.fromJson(Map<String, dynamic> json) {
    return ShowUserModel(
        roles : json["roles"] == null ? null : List<String>.from(json["roles"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        userName: json["userName"],
        street: json["street"],
        city: json["city"],
        phone: json["phone"],
        addresses: json["addresses"] ?? []
    );
  }

  @override
  List<Object?> get props =>
      [roles,firstName, lastName, email, userName, street, city, phone, addresses,];
}