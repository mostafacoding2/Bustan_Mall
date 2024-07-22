import 'package:equatable/equatable.dart';
class RegisterModel extends Equatable {
  final String? email;
  final List<String>? roles;
  final String? token;
  final String? expiresOn;
  const RegisterModel(
      { required this.email, required this.roles, required this.token, required this.expiresOn});
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(email: json["email"],
        roles: json["roles"] == null ? null : List<String>.from(json["roles"]),
        token: json["token"],
        expiresOn: json["expiresOn"]);
  }
  @override
  List<Object?> get props => [email, roles, token, expiresOn];
}