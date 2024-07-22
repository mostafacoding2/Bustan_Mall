import 'package:equatable/equatable.dart';

class ChangePasswordModel extends Equatable {
  final ErrorsChangePassword? errors;
  final int? status;
  final String? type;
  final String? title;
  final String? traceId;

  const ChangePasswordModel({required this.type,
    required this.title,
    required this.traceId,
    required this.errors,
    required this.status});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      errors: json["errors"] == null
          ? null
          : ErrorsChangePassword.fromJson(json["errors"]),
      type: json["type"],
      title: json["title"],
      status: json["status"],
      traceId: json["traceId"],
    );
  }

  @override
  List<Object?> get props => [errors, status, type, title, traceId];
}

class ErrorsChangePassword extends Equatable {
  final List<String>? userName;
  final List<String>? newPassword;
  final List<String>? oldPassword;
  final List<String>? confirmNewPassword;

  const ErrorsChangePassword({required this.userName,
    required this.newPassword,
    required this.oldPassword,
    required this.confirmNewPassword});

  factory ErrorsChangePassword.fromJson(Map<String, dynamic> json) {
    return ErrorsChangePassword(
        userName: json["UserName"] == null
            ? null
            : List<String>.from(json["UserName"]),
        newPassword: json["NewPassword"] == null
            ? null
            : List<String>.from(json["NewPassword"]),
        oldPassword: json["OldPassword"] == null
            ? null
            : List<String>.from(json["OldPassword"]),
        confirmNewPassword: json["ConfirmNewPassword"] == null
            ? null
            : List<String>.from(json["ConfirmNewPassword"]));
  }

  @override
  List<Object?> get props =>
      [userName, newPassword, oldPassword, confirmNewPassword,];
}
