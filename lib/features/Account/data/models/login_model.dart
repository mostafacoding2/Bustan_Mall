import 'package:equatable/equatable.dart';
class LoginModel extends Equatable {
  final String mytoken;
  final String expiration;
 final List<String>? roles;
  const LoginModel({required this.roles,required this.mytoken, required this.expiration});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
          roles:json["roles"] == null ? null : List<String>.from(json["roles"]),
          mytoken: json['mytoken'], expiration: json['expiration']);
  @override
  List<Object?> get props => [mytoken, expiration,roles];
}
