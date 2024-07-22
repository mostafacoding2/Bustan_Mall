import 'package:equatable/equatable.dart';

class FailureReview extends Equatable {
  final ErrorsModel? errors;
  final int? status;

  const FailureReview({ required this.errors, required this.status});

  @override
  List<Object?> get props => [errors, status];

  factory FailureReview.fromJson(Map<String, dynamic> json){
    return FailureReview(
        errors: json["errors"] == null ? null : ErrorsModel.fromJson(
            json["errors"]),
        status: json["status"]);
  }
}
class ErrorsModel extends Equatable {
  final List<String>? comment;
  const ErrorsModel({ required this.comment});
  @override
  List<Object?> get props => [comment];
  factory ErrorsModel.fromJson(Map<String, dynamic> json) {
    return ErrorsModel
      (comment: json["Comment"] == null ? null : List<String>.from(
        json["Comment"]),);
  }
}
