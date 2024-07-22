import 'package:equatable/equatable.dart';

class FailureRegisterModel extends Equatable {
  final ErrorsRegister? errors;
  final int? status;
  final String? type;
  final String? title;
  final String? traceId;
  const FailureRegisterModel(
      {required this.type, required this.title, required this.traceId, required this.errors, required this.status});
  factory FailureRegisterModel.fromJson(Map<String, dynamic> json) {
    return FailureRegisterModel(
      errors: json["errors"] == null ? null : ErrorsRegister.fromJson(
          json["errors"]),
      type: json["type"],
      title: json["title"],
      status: json["status"],
      traceId: json["traceId"],
    );
  }

  @override
  List<Object?> get props => [errors, status, type, title, traceId];
}

class ErrorsRegister extends Equatable {
  final List<String>? City;
  final List<String>? Email;
  final List<String>? Phone;
  final List<String>? Street;
  final List<String>? LastName;
  final List<String>? Password;
  final List<String>? UserName;
  final List<String>? FirstName;
  final List<String>? ConfirmPass;

  const ErrorsRegister(
      { required this.LastName, required this.Password, required this.UserName, required this.FirstName, required this.ConfirmPass, required this.City, required this.Email, required this.Phone, required this.Street});

  @override
  List<Object?> get props =>
      [
        City,
        Email,
        Phone,
        Street,
        LastName,
        Password,
        UserName,
        FirstName,
        ConfirmPass,
      ];

  factory ErrorsRegister.fromJson(Map<String, dynamic> json) {
    return ErrorsRegister(
        City: json["City"] == null ? null : List<String>.from(json["City"]),
        Email: json["Email"] == null ? null : List<String>.from(json["Email"]),
        Phone: json["Phone"] == null ? null : List<String>.from(json["Phone"]),
        Street: json["Street"] == null ? null : List<String>.from(
            json["Street"]),
        LastName: json["LastName"] == null ? null : List<String>.from(
            json["LastName"]),
        Password: json["Password"] == null ? null : List<String>.from(
            json["Password"]),
        UserName: json["UserName"] == null ? null : List<String>.from(
            json["UserName"]),
        FirstName: json["FirstName"] == null ? null : List<String>.from(
            json["FirstName"]),
        ConfirmPass: json["ConfirmPass"] == null ? null : List<String>.from(
            json["ConfirmPass"])
    );
  }
}